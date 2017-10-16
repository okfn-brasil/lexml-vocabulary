--
-- Manutenção do vocabulário de jurisdições, tabela original tmpcsv_localidade
-- Tabelas de apoio: tmpcsv_br_state_codes, tmpcsv_br_city_codes
--

CREATE VIEW vw_city AS
  SELECT c.*, s.name as state_name, s.lexlabel as state_lexlabel, 
         'br;'||s.lexlabel||';'||c.lexlabel as urnlex_jur
  FROM tmpcsv_br_city_codes c INNER JOIN tmpcsv_br_state_codes s 
    ON c.state=s.subdivision
;

CREATE VIEW vw_city_synonyms AS
  SELECT c.*, s.name as state_name, s.lexlabel as state_lexlabel, 
         'br;'||s.lexlabel||';'|| oficial.name2lex(synonym) as urnlex_jur
  FROM tmpcsv_br_city_synonyms c INNER JOIN tmpcsv_br_state_codes s 
    ON c.state=s.subdivision
;

CREATE VIEW vw_geral_urnlex AS
  SELECT urnlex_jur FROM vw_city
  UNION  SELECT 'br'
  UNION  SELECT 'br;df'
  UNION  SELECT 'br;'||lexlabel FROM tmpcsv_br_state_codes
  UNION
  SELECT urnlex_jur FROM  vw_city_synonyms where substr(type,1,3)='alt'
;

----

CREATE VIEW vw_localidade_city AS
  SELECT l.*, c.name as city_name, c.state as city_state 
  FROM tmpcsv_localidade l INNER JOIN vw_city c 
    ON l.about=c.urnlex_jur
;

CREATE VIEW vw_localidade_state AS
  SELECT l.*, s.name as state_name, s.subdivision as state_abbrev
  FROM tmpcsv_localidade l INNER JOIN tmpcsv_br_state_codes s 
    ON l.about=('br;'||s.lexlabel)
;





