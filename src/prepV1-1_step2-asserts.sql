/**
 * ASSERTIONS - conferindo consistência....
 * Ver https://github.com/okfn-brasil/lexml-vocabulary/issues/7
 */

\echo '-- ASSERT 1: listagem para conferir visualmente se cidades não aparecem'
SELECT about, faceta
FROM dataset.vw_localidade
WHERE about NOT IN (SELECT urn_jur FROM vwtest_geral_urnlex)
ORDER BY 1
; -- se tudo ok vai retornar apenas justica, etc. nada de cidades

\echo '-- ASSERT 2: listagem de itens ausentes no vocabulário de localidade'
SELECT urn_jur as ausente, concat(name,' (',state,')') as name, idibge
FROM dataset.vw_br_city_codes_full
WHERE urn_jur NOT IN (
    SELECT dataset.br_city_canonic(about) FROM dataset.vw_localidade
)
; -- se tudo ok retorna vazio, senão a lista é de itens a serem inclusos em Localidade.

\echo '-- ASSERT 3: listagem de itens com grafia de localidade errada'
SELECT about as about_errado, canonic as about_correto
FROM (
    SELECT about, dataset.br_city_canonic(about) as canonic FROM dataset.vw_localidade
) t
WHERE canonic!=about;
-- se tudo ok retorna vazio, senão é são itens a serem corrigidos conforme canônico.
