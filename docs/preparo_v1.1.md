# Preparo para obtenção da versão 1.1 

Ações realizadas para conferir os dados e efetuar a sua manutenção.

## Jurisdições

Pode-se conferir a situação dos dados relativos à jurisdião,
partir da carga dos *datasets* padronizados e das VIEWS de JOIN das tabelas,

```sh
sh src/cache/makeTmp.sh
# falta lib sql
PGPASSWORD=postgres psql -h localhost -U postgres obsjats < src/cache/makeTmp.sql
PGPASSWORD=postgres psql -h localhost -U postgres obsjats < src/prepV1_step1.sql
```

A tabela `tmpcsv_localidade` neste momento representa a versão mais atual do vocabulário *localidade*.

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


