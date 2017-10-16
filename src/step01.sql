-- -- -- -- -- --
-- EXTRAS from https://github.com/datasets-br/diariosOficiais/blob/master/src/step1_strut.sql

CREATE SCHEMA oficial;

CREATE FUNCTION oficial.normalizeterm(
	text, 
	boolean DEFAULT true
) RETURNS text AS $f$
   SELECT (  tlib.normalizeterm(
          CASE WHEN $2 THEN substring($1 from '^[^\(\)\/;]+' ) ELSE $1 END,
	  ' ',
	  255,
          ' / '
   ));
$f$ LANGUAGE SQL IMMUTABLE;


CREATE or replace FUNCTION oficial.name2lex(
  p_name text, 
  p_normalize boolean DEFAULT true, 
  p_cut boolean DEFAULT true
) RETURNS text AS $f$
   SELECT trim(replace(
	   regexp_replace(
	     CASE WHEN p_normalize THEN oficial.normalizeterm($1,p_cut) ELSE $1 END,
	     E' d[aeo] | d[oa]s | com | para |^d[aeo] | / .+| [aeo]s | [aeo] |[\-\' ]',
	     '.', 
	     'g'
	   ),
	   '..',
           '.'
       ),'.')
$f$ LANGUAGE SQL IMMUTABLE;


