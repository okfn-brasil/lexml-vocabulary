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
The CSV files here (at *git*) are references, to human-readable and basic hands-on interface, use [this collaborative spreadsheet](https://docs.google.com/spreadsheets/d/1FbRVToE2Yu2I7_jfL0mD_MaxWe-m9aKM6ukPqkpju64/edit#gid=1020275856). After some modifications export back to the *git*.
