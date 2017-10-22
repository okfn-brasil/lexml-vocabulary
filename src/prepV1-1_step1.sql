--
-- Manutenção do vocabulário de jurisdições (localidade), anãlise e preparo da versão v1.0
-- Tabelas de apoio: tmpcsv_br_state_codes, tmpcsv_br_city_codes
--

-- NEWS
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
  -- precisa?  where substr(type,1,3)='alt'
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
