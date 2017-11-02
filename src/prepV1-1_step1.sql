--
-- Manutenção do vocabulário de jurisdições (localidade), anãlise e preparo da versão v1.0
-- Tabelas de apoio: tmpcsv_br_state_codes, tmpcsv_br_city_codes
--

CREATE VIEW dataset.vw_br_state_codes_lex AS
   SELECT 'br;'||lexlabel as urn_jur, subdivision FROM dataset.vw_br_state_codes;

CREATE VIEW dataset.vw_br_city_codes_full AS
  SELECT c.*, x.urn_jur||';'||c.lexlabel as urn_jur
  FROM dataset.vw_br_city_codes c  INNER JOIN dataset.vw_br_state_codes_lex x
       ON  x.subdivision=c.state;

CREATE VIEW dataset.vw_br_city_synonyms_full AS
  SELECT c.*, x.urn_jur as state_lexlabel,
                 x.urn_jur ||';'|| lib.name2lex(synonym) as urn_jur
  FROM dataset.vw_br_city_synonyms c  INNER JOIN dataset.vw_br_state_codes_lex x
       ON  x.subdivision=c.state
  WHERE substr(type,1,3)='alt'; -- type IN ('alt canonico','alt oficial') -- exclui abreviações
  ;

CREATE VIEW vwtest_geral_urnlex AS
  SELECT 'br' as urn_jur
  UNION  (SELECT 'br;df')
  UNION (SELECT urn_jur FROM dataset.vw_br_state_codes_lex)
  UNION (SELECT urn_jur FROM  dataset.vw_br_city_codes_full)
  UNION (SELECT urn_jur FROM  dataset.vw_br_city_synonyms_full)
;
-- --
CREATE or replace FUNCTION dataset.br_city_canonic(text) RETURNS text AS $f$
  SELECT COALESCE((
    SELECT state_lexlabel||';'||lexlabel
    FROM dataset.vw_br_city_synonyms_full
    WHERE urn_jur=$1),
    $1
  );
$f$ LANGUAGE SQL IMMUTABLE;

-- -- -- -- -- -- --
-- -- -- -- -- -- --

CREATE SCHEMA lex; -- for URN LEX and its vocabularies

CREATE or replace FUNCTION lex.abbrev_urn(p_broader text,p_val text) RETURNS text  AS $f$
  SELECT translate( COALESCE(lib.name2lex($1)||';','') || lib.name2lex($2) , '#', '');
$f$ LANGUAGE SQL IMMUTABLE;

/**
* Seleciona um vocabulário direto do dataset.big, com JSON
* JSON vocabulary (tabular representation from CSV) to JSON-LD
*/
CREATE or replace FUNCTION lex.voc_asjsonld(
  p_vocname text,
  p_byabout boolean DEFAULT false
) RETURNS setof JSONb  AS $f$
  SELECT jsonb_build_object(
      '@type',  'skos:Concept'
      ,'rdf:id', c->0
      ,'rdf:about', c->1
      ,'skos:prefLabel',
         jsonb_build_object(
           '@language',c->3
           ,'@value',   c->2
           ,'@lexml:facetaAcronimo', c->6
           ,'@lexml:faceta',         c->7
         )
    ) || (SELECT CASE WHEN c->>5 IS NOT NULL
      THEN jsonb_build_object('skos:broader',jsonb_build_object('rdf:resource',c->5))
      ELSE '{}'::JSONb END
    ) || (SELECT CASE WHEN c->>4 IS NOT NULL
      THEN jsonb_build_object('skos:altLabel',jsonb_build_object(  -- forcing to be acronym
        '@language','acronym'
        ,'@value',   c->4
        ,'@lexml:urnAlt', lex.abbrev_urn(c->>5,c->>4)
      )) ELSE '{}'::JSONb END
    ) AS j
  FROM dataset.big
  WHERE big.source = dataset.idconfig($1)
  ORDER BY (big.c->>0)::int -- by ID
  ;
$f$ LANGUAGE SQL IMMUTABLE;

/**
 * Returns a LexML vocabulary in JSON-LD format.
 * USO:  COPY (SELECT jsonb_pretty(j) FROM lex.voc_tojsonld('autoridade') t(j)) TO '/tmp/test.json';
 *       sed 's/\\n/\n/g' < /tmp/test.json > data-cache/autoridade.json
 */
CREATE or replace FUNCTION lex.voc_tojsonld(p_vocname text) RETURNS JSONb AS $f$
  SELECT '{"@context":{
        "dc":"http://purl.org/dc/elements/1.1/",
        "dcterms":"http://purl.org/dc/terms/",
        "lexml":"http://www.lexml.gov.br/voc/br/",
        "rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#",
        "rdfs":"http://www.w3.org/2000/01/rdf-schema#",
        "skos":"http://www.w3.org/2008/05/skos#",
        "xsd":"http://www.w3.org/2001/XMLSchema#"
        }}'::JSONb  || jsonb_build_object('@graph',(
          SELECT to_jsonb(  array_agg(j)  )
          FROM lex.voc_asjsonld($1) t(j)
        ));
$f$ LANGUAGE SQL IMMUTABLE;


/*
COPY (SELECT jsonb_pretty(j) FROM lex.voc_tojsonld('autoridade') t(j)) TO '/tmp/autoridade.json';
COPY (SELECT jsonb_pretty(j) FROM lex.voc_tojsonld('localidade') t(j)) TO '/tmp/localidade.json';
COPY (SELECT jsonb_pretty(j) FROM lex.voc_tojsonld('tipodocumento') t(j)) TO '/tmp/tipoDocumento.json';

sed 's/\\n/\n/g' < /tmp/autoridade.json > data-cache/autoridade.json
sed 's/\\n/\n/g' < /tmp/localidade.json > data-cache/localidade.json
sed 's/\\n/\n/g' < /tmp/tipoDocumento.json > data-cache/tipoDocumento.json
*/
