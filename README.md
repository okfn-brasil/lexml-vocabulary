# Vocabulários LexML

&nbsp; [![goodtables.io](https://goodtables.io/badge/github/okfn-brasil/lexml-vocabulary.svg)](https://goodtables.io/github/okfn-brasil/lexml-vocabulary)
 &nbsp;&nbsp;&nbsp; [![](https://upload.wikimedia.org/wikipedia/commons/e/eb/PICOL_icon_View.svg)](http://data.okfn.org/tools/view?url=https%3A%2F%2Fraw.githubusercontent.com%2Fokfn-brasil%2Flexml-vocabulary%2Fmaster%2Fdatapackage.json)

Os vocabulários do [projeto LexML Brasil](https://pt.wikipedia.org/wiki/LexML_Brasil), conforme apresentados na [Parte 6 das normas LexML](http://projeto.lexml.gov.br/documentacao/Parte-6-Vocabularios-Controlados.pdf),  são utilizados na [URL LEX](https://en.wikipedia.org/wiki/Lex_(URN)) ([Parte 2](http://projeto.lexml.gov.br/documentacao/Parte-2-LexML-URN.pdf)). Eles  também são  referência para títulos e seções nos Diários Oficiais do governo brasileiro.

Na ausência de um comitê formal previsto pela seção 1.1 das normas LexML, os mantenedores do presente repositório *git* assumem parcialmente os compromissos do "Comitê Central para a Atribuição de Nomes" do LexML.

Os vocabulários são aqueles definidos nas seções 2 e 3 como "2.1 *Natureza do Conteúdo*" (`tipoConteudo`), "2.2 *Língua*" (`lingua`),  "2.3 *Evento*" (`evento`),  "3.1 *Localidade*" (`localidade`),  "3.2 *Autoridade*" (`autoridade`) e  "3.3 *Tipo de Documento*" (`tipoDocumento`),
disponíveis nas pastas [/data/RDF-v*](data) do presente repositório, com proveniência e autenticidade descritos [nesta documentação](docs/preparo.md). Seu formato foi inspirado no [padrão RDA](https://en.wikipedia.org/wiki/Resource_Description_and_Access) (ver [rdaregistry.info](http://www.rdaregistry.info/)).

## Versão corrente dos vocabulários

Ver [_tag_ de versão próprio *git*](https://github.com/okfn-brasil/lexml-vocabulary/releases). Atualmente, outubro de 2017, a versão corrente dos arquivos se encontra em [/data/RDF-v1.0](data/RDF-v1.0). As _tags_ de versão seguem a sintaxe de [MAJOR.MINOR.PATCH](http://semver.org/), sendo que nas pastas não são destacados os *patches*.

## Planejamento e objetivos das versões

* **Versão 1.0**: versão original e em conformidade com a versão 1.0 da Parte-6 das normas LexML. Versões 1.0.X serão decorrentes apenas manutenção.

* **Versão 1.1**: manutenções e correções maiores, para refletir a realidade de 2017, principalmente nos vocabulários de jurisdição e autoridade. Algumas regras sintáticas das URNs afetariam as canônicas, mas sem maior impacto no acervo.

* **Versão 1.2**: revisão e manutenção para acolher de forma mais ampla documentos da esfera municipal, e oferecer apoio à grafia controlada de títulos nos diários oficiais das diversas esferas e escopos previstos pelo LexML. No RDF também seriam acrescentados novos atributos, para garantir alinhamento com outras ontologias, tais como Wikidata.

A partir da versão 1.2 o presente repositório também seria ofereceria dois complementos:

* "tabela de sinônimos", desacoplada do vocabulário dos termos canônicos presentes nos arquivos RDF, para garantir que todos os sinônimos ocorridos em dois ou mais documentos oficiais (do próprio acervo LexML ou padrões alternativos como IBGE e ISO) sejam contemplados pelos esquemas da resolução em nomes canônicos.

* "tabela de instâncias", associando prefixos de URNs LEX com respectivos identificadores Wikidata, nos casos com semântica específica diversa ou mais restritiva do que aquela prevista pelas partes.

NOTA: para revisão ténica e organização dos algoritmos de preparo dos *datasets* (representação dos vocabulários como CSV e integração com outros *datasets*) está sendo proposto o uso de [sql-dataset-unifier](https://github.com/datasets-br/sql-unifier).

## Organização do repositório

* Dados: pasta [/data](data) com descritores padrão [*FrictionLess Data*](http://frictionlessdata.io/) (ver [datapackage.json](datapackage.json)).

* Documentação: este README e documentos de [/docs](docs),
   * [Preparo dos dados](docs/preparo.md)
   * [Preparo dos sinônimos](docs/sinonimos.md)
   * [Preparo das instâncias](docs/instancias.md)

* Algoritmos e implemetações: pasta [/src](src) com os códigos-fonte dos algoritmos de preparo e processamento utilizados no projeto.

## Licenças

* **Algoritmos e código-fonte de software**: licença relativa à pasta `/src`. [MIT license](https://spdx.org/licenses/MIT.html).

* **Arquivos CSV, JSON, XML e demais arquivos de dados**: [ODbL-1.0](https://spdx.org/licenses/ODbL-1.0.html)

* **Documentação e demais conteúdos ou descrições metodológicas**: [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

