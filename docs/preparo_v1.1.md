# Preparo para obtenção da versão 1.1

O principal requisito da *versão 1.1 dos vocabulários LexML* é a manutenção da [versão 1.0](../data/RDF-v1.0), trazendo atualizações e corrigindo falhas menores.  A seguir uma descrição das ações realizadas para auditorar os *datasets* e efetuar a sua manutenção.

Todos os procedimentos de preparo foram realizados com apoio do _framework_ [sql-unifier](https://github.com/datasets-br/sql-unifier), que permite comparar cada vocabulário com [*datasets*](https://github.com/datasets-br) já homologados.

## Preparo do SQL-datasets-unifier

Adotou-se a seguinte configuração [`conf.json` do SQL-datasets-unifier](https://github.com/datasets-br/sql-unifier), para carga dos *datasets* auxiliares e [dos três vocabulários v1.0](https://github.com/okfn-brasil/lexml-vocabulary/tree/v1.0.0/data):

```json
{
   "github.com":{
        "okfn-brasil/lexml-vocabulary":null,
        "datasets-br/state-codes":"br-state-codes",
        "datasets-br/city-codes":null,
        "datasets-br/cbh-codes":null
   },
   "useBig":true, "useIDX":false, "useRename":true
}
```
PS: na verdade para que todo o preparo seja [reprodutivel](https://en.wikipedia.org/wiki/Reproducibility) no futuro, deve-se adotar `lexml-vocabulary/tree/v1.0.0`,   `datasets-br/state-codes/tree/v1.1.0` e provavelmente *city-codes v1.0.0*.

O sumário é fornecido por `SELECT * FROM dataset.vw_meta_summary`,

id |     tmp_name     |               pkey               | lang | n_fields
---|------------------|----------------------------------|------|----------
  1 | autoridade       | ["about"]                        | pt   |        6
  2 | localidade       | ["about"]                        | pt   |        6
  3 | tipodocumento    | ["about"]                        | pt   |        6
  4 | br_state_codes   | id                               | en   |       15
  5 | br_city_synonyms | ["state", "lexLabel", "synonym"] | pt   |        5
  6 | br_city_codes    | ["state", "lexLabel"]            | pt   |        9


## Vocabulário localidade

A *SQL view* `dataset.vw_localidade` representa de maneira tabular a v1.0 do vocabulário *localidade*.   As *views* complementares de [`/src/prepV1-1_step1.sql`](../src/prepV1-1_step1.sql)

Pode-se conferir a situação dos dados relativos às jurisdições,
partir da carga dos *datasets* padronizados e das VIEWS de JOIN das tabelas,

Pretende-se:

1. Substituir a faceta por um rótulo de faceta, "geral/municipio", "geral/uf" ou "geral/pais". No PostGIS corresponderia a um *layer* do mapa. 2. Acrescentar estados e territórios que estão faltando
3. Acrescentar municípios que estão faltando.
4. Atualizar nomes de municípios grafados de forma distinta do padrão IBGE.
5. Acrescentar hidrobacias

```sql

-- confere itens não-contemplados por sinônimos
SELECT about FROM tmpcsv_localidade WHERE about NOT IN (SELECT urnlex_jur FROM vw_geral_urnlex) order by 1;

-- Ideal criar dataset com descrição da origem das demais jurisdições:
--  
 br;justica.eleitoral
 br;justica.eleitoral;paraiba
 br;justica.federal
 br;justica.trabalho

 br;amapa;justica.estadual

Resolver ambiguidade entre taxonimias "br;justica.eleitoral;paraiba" e "br;paraiba;justica.estadual"
-- ideal ter sintaxe de escopo tal como "_jus"


### Comitês de Bacia Hidrográfica
Ainda em fase de avaliação (constituem-se jurisdições ou autoridades?)
```sql
SELECT 'br;'||s.lexlabel || ';cbh;'|| replace(lib.name2lex(c.name),'cbh.','') as urn_jur  
FROM dataset.vw_cbh c inner join dataset.vw_br_state_codes s
  ON c.uf=s.subdivision;
```
