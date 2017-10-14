# Preparo dos dados 

A seguir os procedimentos que estabelecem a [proveniência de dados](https://en.wikipedia.org/wiki/Data_lineage) dos arquivos presentes na pasta [`/data`](../data).

O preparo inicial e conversões se baseiam em algoritmos gerais de processamento XML baseados na [LibXML2](http://xmlsoft.org/). A implementação de referência foi realizada em PHP:

* [xml2xcleaned.php](../src/xml2xcleaned.php): limpa o XML, normalizando espaços e ordem dos atributos em conformidade com o XML canônico, [XML-C14N](https://www.w3.org/TR/xml-c14n); porém apresentando o XML de forma usual, com sintaxe de elementos vazios e algum espaçamento (padrão LibXML2) destacando hierarquia.

* [vocLexMLRdf2csv.php](../src/vocLexMLRdf2csv.php): converte o XML RDF em tabela, criando os arquivos CSV de referência para o trabalho terminológico, assim como inspeção visual em planilhas. 

* *Planilha colaborativa*: a interface colaborativa para os arquivos CSV (por exemplo aqueles obtidos via *vocLexMLRdf2csv*), mais amigável para usuários leigos e sem ferramental, está sendo mantida [nesta planilha colaborativa](https://docs.google.com/spreadsheets/d/1FbRVToE2Yu2I7_jfL0mD_MaxWe-m9aKM6ukPqkpju64/edit#gid=1020275856), sem valor de registro (aspenas os arquivos CSV correspondentes no *git* têm esse valor).

## Fundamentos e motivações

### Preservação digital

Por se tratar de um repositório público com controle de versões, em particular por se tratar do uso do [sistema *git*](https://en.wikipedia.org/wiki/Git), o presente repositório já vem munido de *checksum* [SHA1](https://en.wikipedia.org/wiki/SHA-1): o que garante a **[integridade física](https://en.wikipedia.org/wiki/Data_integrity#Physical_integrity)** dos arquivos durante as operações cotidianas e, em parte, garante também a sua [autenticidade](https://en.wikipedia.org/wiki/Message_authentication) dos arquivos. 

Para fins de **[preservação de longo prazo](https://en.wikipedia.org/wiki/Digital_preservation)**, essa mesma garantia pode ser [ampliada se acrescentamos mais uma *hash*](https://crypto.stackexchange.com/a/44281/42893), notadamente [*SHA3 do padrão FIPS 202 de 2015*](https://en.wikipedia.org/wiki/SHA-3). A linha de comando abaixo pode ser utilizada em qualquer sistema Linux para a obtenção do arquivo `sha3-256sum.txt` de todos os demais arquivos de uma pasta:

```sh
sha3sum -a 256 *.* | grep -v sha3-256sum > sha3-256sum.txt
```

## Proveniência

A garantia de autenticidade dos arquivos é reforçada pelo testemunho dos usuários e o acesso às versões. Alguns processos de preparo levam em consideração a [auditoria de *commits*](https://en.wikipedia.org/wiki/Commit_(version_control)) específicos que comprovam ambos, a preservação do original e algum processo simples de conversão rastreável. 

Esses *commits* são explicitamente indicados na seção "Preparo inicial" do presente documento de descrição do preparo dos dados.

## Preparo inicial

Os arquivos da pasta [`/data/RDF-v1`](../data/RDF-v1) são cópias dos **vocabulários originais**, citados pela [Parte 6 do LexML](http://projeto.lexml.gov.br/documentacao/Parte-6-Vocabularios-Controlados.pdf) e acessíveis como arquivos XML RDF em [dadosabertos.senado.leg.br](http://dadosabertos.senado.leg.br/dataset/vocabul-rios-controlados-da-urn-lex), em outubro de 2017.

A cópia dos originais foi obtida diretamente do download dos arquivos: 

```sh
wget  http://www.lexml.gov.br/vocabulario/autoridade.rdf.xml 
wget  http://www.lexml.gov.br/vocabulario/evento.rdf.xml
wget  http://www.lexml.gov.br/vocabulario/lingua.rdf.xml
wget  http://www.lexml.gov.br/vocabulario/localidade.rdf.xml 
wget  http://www.lexml.gov.br/vocabulario/tipoConteudo.rdf.xml 
wget  http://www.lexml.gov.br/vocabulario/tipoDocumento.rdf.xml 
```

Ela está registrada no *commit* [ffb7df3e97431c036306497540fd2b8dafc6c66c](https://github.com/okfn-brasil/lexml-vocabulary/tree/ffb7df3e97431c036306497540fd2b8dafc6c66c/data/RDF-v1) da pasta `/data/RDF-v1`, e corresponde justamente à "versão 1.0" do vocabulário.


Em seguida foi realizada a normalização dos arquivos XML via *xml2xcleaned*, e a geração de *checksum*:

```sh
php src/xml2xcleaned.php http://www.lexml.gov.br/vocabulario/autoridade.rdf.xml > data/RDF-v1/autoridade.rdf.xml
php src/xml2xcleaned.php http://www.lexml.gov.br/vocabulario/evento.rdf.xml > data/RDF-v1/evento.rdf.xml
php src/xml2xcleaned.php http://www.lexml.gov.br/vocabulario/lingua.rdf.xml > data/RDF-v1/lingua.rdf.xml
php src/xml2xcleaned.php http://www.lexml.gov.br/vocabulario/localidade.rdf.xml > data/RDF-v1/localidade.rdf.xml
php src/xml2xcleaned.php http://www.lexml.gov.br/vocabulario/tipoConteudo.rdf.xml > data/RDF-v1/tipoConteudo.rdf.xml
php src/xml2xcleaned.php http://www.lexml.gov.br/vocabulario/tipoDocumento.rdf.xml > data/RDF-v1/tipoDocumento.rdf.xml
cd data/RDF-v1
sha3sum -a 256 *.* | grep -v sha3-256sum > sha3-256sum.txt
cd ../..
```

As alterações do commit "65ac544a8c480d84e880d382ccc77cf947c142ea", [conforme `git diff -w`](https://github.com/okfn-brasil/lexml-vocabulary/commit/65ac544a8c480d84e880d382ccc77cf947c142ea), podem ser rastreadas: consistem apenas de apenas espaçamento e ordem dos atributos é afetada.

## Preparo dos arquivos CSV

Arquivos CSV obtidos dos originais (v1):
```sh
 php src/vocLexMLRdf2csv.php data/RDF-v1/autoridade.rdf.xml    > data/autoridade-v1.csv
 php src/vocLexMLRdf2csv.php data/RDF-v1/localidade.rdf.xml    > data/localidade-v1.csv
 php src/vocLexMLRdf2csv.php data/RDF-v1/tipoDocumento.rdf.xml > data/tipoDocumento-v1.csv
```

Depois desta primeira versão, as atualizações (novos *commits*) correspondem às modificações de manutenção ou revisão previstas pelo projeto. Uma versão de planilha mais amigável é oferecida na interface de planilha colaborativa, ver link no inicio deste documento.

Os arquivos CSV são posteriormente transformados ou integrados aos arquivos XML RDF, consolidando a versão final de produção dos vocabulários.



