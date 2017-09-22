# lexml-vocabulary
RDF vocabulary of LexML, revision and ontology-alignment with Wikidata and others

## Prepare

```sh
 php src/vocLexMLRdf2csv.php http://www.lexml.gov.br/vocabulario/autoridade.rdf.xml \
  > data/autoridade-v1.csv
 php src/vocLexMLRdf2csv.php http://www.lexml.gov.br/vocabulario/localidade.rdf.xml \
  > data/localidade-v1.csv
 php src/vocLexMLRdf2csv.php http://www.lexml.gov.br/vocabulario/tipoDocumento.rdf.xml \
  > data/tipoDocumento-v1.csv
```



