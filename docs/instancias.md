# Instâncias semânticas especializadas

Cada *vocabulário LexML* estabelece uma terminologia controlada com *ortografia* precisa, mas sem maior precisão no *significado* do termo (pela sua própria natureza de "termo isolado de contexto").  Já a concatenação de dois ou mais termos dos vocabulários LexML numa  URN LEX proporciona o estabelecimento de significados mais precisos. <br/>Por exemplo "Assembleia Legislativa" e "Bahia" são termos válidos de vocabulários distintos. Juntos, `br;bahia:assembleia.legislativa`, estabelecem  um significado preciso.

Esses significados resultantes de concatenações resultam em "instâncias semânticas" dos vocabulários LexML, que por sua vez proporcionam o *alinhamento* destas instâncias com vocabulários externos, tais como a [Wikidata](https://www.wikidata.org).

## Contexto de uso dos vocabulários LexML

Documentos, como recursos bibliográficos, podem ser identificados de forma única, inclusive por um nome próprio ou um título.
O "nome universal do recurso" no contexto LexML, é o [URN LEX](https://en.wikipedia.org/wiki/Lex_(URN)). É o elemento central dos *padrões LexML*,  garantindo a interoperabilidade e a transparência num sistema que adote esses padrões.  

Os documentos publicados nos diários oficiais são de responsabilidade de quem criou seu conteúdo, a assim-chamada *autoridade emitente* do documento.

O URN LEX faz uso da representação compacta do título do documento: por exemplo se o título é *"Lei nº 11.705 de 19 junho de 2008"* a sua URN LEX conterá `lei:2008-06-19;11705`. Como diferentes autoridades podem adotar os mesmos títulos para seus respectivos documentos, a URN LEX se torna única e não ambígua por incluir na sua expressão o nome da autoridade emitente. Assim duas autoridades _A1_ e _A2_  podem batizar seus respectivos documentos de `A1:lei:2008-06-19;11705` e `A2:lei:2008-06-19;11705`, com a certeza de não estarem criando conflitos de identificação.

Matérias publicadas por um Diário Oficial  são documentos passíveis de *identificação transparente* por URN LEX. É um nome composto de partes:

> `urn:lex:`JURISDIÇÃO`:`AUTORIDADE`:`TIPO`:`DATA`;`ID_LOCAL

Exemplos:
*  [`urn:lex:br:federal:constituicao:1988-10-05;1988`](http://www.lexml.gov.br/urn/urn:lex:br:federal:constituicao:1988-10-05;1988)
*  [`urn:lex:br:federal:lei:2008-06-19;11705`](http://www.lexml.gov.br/urn/urn:lex:br:federal:lei:2008-06-19;11705)
* [`urn:lex:br;sao.paulo;campinas:camara.municipal:resolucao:2011-12-14;866`](http://www.lexml.gov.br/urn/urn:lex:br;sao.paulo;campinas:camara.municipal:resolucao:2011-12-14;866)
* [`urn:lex:br;minas.gerais:assembleia.legislativa:resolucao:2015-12-01;5511`](http://www.lexml.gov.br/urn/urn:lex:br;minas.gerais:assembleia.legislativa:resolucao:2015-12-01;5511)
* [`urn:lex:br:tribunal.superior.trabalho;turma.4:acordao;rr:2010-12-15;61100-2004-118-8-0`](http://www.lexml.gov.br/urn/urn:lex:br:tribunal.superior.trabalho;turma.4:acordao;rr:2010-12-15;61100-2004-118-8-0)

Há como que uma [cadeia de delegação de responsabilidades](https://medium.com/d/c79aceeb1f03) inerente à hierarquia das partes da URN LEX: cada parte é o nome da entidade responsável pelo batismo da seguinte.

Quem batiza o documento, dando um *ID_LOCAL* a ele, é uma [entidade do governo](http://schema.org/GovernmentOrganization) (ministério, tribunal, prefeitura, subprefeitura, secretaria, câmara, etc.). Esta entidade, por sua vez, é batizado pelo nome `JURISDIÇÃO`:`AUTORIDADE`, que surge da concatenação de valores de dois vocabulários... São ao todo 4 encadeamentos de responsabilidade de batismo:

* `urn:lex` é o *namespace*, o padrão que determina a sintaxe e os vocabulários que podem ou nao ser usados, a começar pelas jurisdições.

* *JURISDIÇÃO*: local onde certas *AUTORIDADE*s serão reconhecidas e outras não.

* *AUTORIDADE*: entidade que assume a responsabilidade pelo conteúdo publicado, e portanto determina também quais *TIPO*s de documento pode emitir.

* *TIPO*: limita a sintaxe e/ou formas de identificação (*ID_LOCAL*) dos documentos produzidos pela autoridade.

O *ID_LOCAL*, como vimos, faz o papel enfim de [nome](http://schema.org/name) do [documento](http://schema.org/Article), controlado localmente pela autoridade. Conforme o caso (ex. decretos) a DATA pode ou não fazer parte desse nome. Todavia, como a *DATA*  é um metadado que se aplica também à caracterização da *JURISDIÇÃO* e da *AUTORIDADE* &mdash; ou seja, reduz o *namespace*  aos nomes vigentes naquela data &mdash;, então a *DATA* acaba sendo um elemento obrigatório na URN LEX.

### Prefixos

Os prefixos das URNs LEX são fragmentos iniciais da URN. Nos exemplos `urn:lex:br:federal`, `urn:lex:br:federal:lei`, `urn:lex:br;sao.paulo;campinas:camara.municipal`, etc. são prefixos, podendo ser tomados a partir da jurisdição (`br:federal`, `br:federal:lei` ou `br;sao.paulo;campinas:camara.municipal`).

**Prefixos de URN LEX** podem ser melhor caracterizados semanticamente do que os itens de vocabulário isolados. Fragmentos de `JURISDIÇÃO`:`AUTORIDADE` ou `JURISDIÇÃO`:`AUTORIDADE`:`TIPO` permitem uma caracterização mais precisa, contemplando o [alinhamento do vocabulário LexML com outras ontologias](https://en.wikipedia.org/wiki/Ontology_alignment).

## Exemplos

A seguir exemplos de diferenciação semântica por especialização do item de vocabulário (instanciação), ou seja, onde deve-se descartar a semântica fixada pelo vocabulário para usar a semântica própria dada pelo prefixo de URN LEX.

### Instâncias jurisdição-autoridade

* A Câmara Municipal de Campinas, `br;sao.paulo;campinas:camara.municipal`, tem semântica bem determinada pelo Wikidata-ID [Q10262936](https://www.wikidata.org/wiki/Q102629). <br/>É mais específica do que `camara.municipal`, o termo isolado do vocabulário de autoridades, que tem significado  genérico [Q102629](https://www.wikidata.org/wiki/Q102629).

* A Assembleia do Estado de São Paulo, `br;sao.paulo:assembleia.legislativa`, com semântica [Q4808730](https://www.wikidata.org/wiki/Q4808730), é  é mais específica que o termo isolado `assembleia.legislativa` ([Q6518196](https://www.wikidata.org/wiki/Q6518196)).

### Instâncias autoridade-tipoDocumento

* O termo genérico "Decreto" (`decreto`) tem significado [Q2571972](https://www.wikidata.org/wiki/Q2571972), insuficiente para determinar a sua precedência no [ordenamento jurídico](https://pt.wikipedia.org/wiki/Ordenamento_jur%C3%ADdico).  Quando contextualizado por uma *autoridade* típica, a precedência fica determinada: `federal:decreto` &gt; `estadual:decreto` &gt; `municipal:decreto`.

* Um Projeto de Lei  da Câmara dos Deputados (`camara.deputados:projeto.lei;pl`) é abreviado como *PL*, enquanto que o mesmo documento quando chega no Senado Federal recebe um novo identificador, com a designação *PLC*, para reforçar que teve a sua origem na Câmara,  `senado.federal:projeto.lei;plc`. Se a proposição legislativa tem origem no próprio Senado, é designada *PLS* (Projeto de Lei do Senado).

### Instanciação por período de vigência

Nomes de jurisdições, autoridades, etc. podem mudar, assim como a entidade nomeada pode deixar de existir. Em ambos os casos há um "término na vigência do nome", ou seja, a URN LEX deixa de ser válida. As principais entidades nomeadas, como exemplificado pelas instâncias semânticas, são:

* jurisdições: todas as jurisdições são instâncias bem determinadas.

* jurisdição-autoridade: apesar de algumas autoridades dispensarem a instanciação de jurisdição, a maioria demanda

O período de vigência da **[entidade nomeada](https://en.wikipedia.org/wiki/Named_entity)** pode ser relevante tanto para a validação das URNs LEX como para a determinação precisa da sua semântica (resolução de ambiguidades).  Exemplos com grafia `nome[intervalo]`:

* o Estado da Guanabara (GB), [Q1155409](https://www.wikidata.org/wiki/Q1155409), como jurisdição, só pode ser empregado em URNs LEX com datas entre 1960 e 1975. <br/>`br;guanabara` [1960..1975]

* o Estado de Mato Grosso (MT), [Q42824](https://www.wikidata.org/wiki/Q42824), foi criado em 1748, e, apesar de ter sido desmembrado em 1979 (quando surgiu MS), continua sendo a mesma entidade nomeada, não se considera o seu desmembramento uma recriação da entidade. <br/>`br;mato.grosso` [1748..]

* a autoridade Supremo Tribunal Federal (STF), [Q519138](https://www.wikidata.org/wiki/Q519138), surgiu em 1890, mantendo o mesmo nome até hoje. Antes o seu equivalente era denominado  Supremo Tribunal de Justiça, mas convencionou-se distinguir o STF como nova entidade.<br/>`br:supremo.tribunal.federal` [1890..]

* o município hoje conhecido como Serra Caiada (RN), determinado como  [Q2298053](https://www.wikidata.org/wiki/Q2298053) na Wikidata, foi criado pela Lei nº 908 de 24 de novembro de 1953, e desde então teve seu nome alterado para "Presidente Juscelino" em 1963,  "Presidente Kubitschek" em 1964, e de volta "Serra Caiada" em 2013.

   * `br;rn;serra.caiada` [1953-11-24..1962-11-30, 2013-01-14..]
   * `br;rn;presidente.juscelino` [1963..1963]
   * `br;rn;presidente.kubitschek` [1964-01-23..2013-01-13]

-----

<br/>NOTA: a preocupação da equipe com a obtenção de alinhamentos semânticos consistentes deve seguir critérios estatísticos.  A caracterização da [frequência de uso de prefixos](https://github.com/okfn-brasil/getlex/blob/master/data/urn_prefixos.csv) é fixada pelo [*acervo* de documentos do LexML](http://lexml.gov.br/desc_acervo.html), que faz o papel de [*corpus* linguístico](https://en.wikipedia.org/wiki/Corpus_linguistics) para decisões e homologações estatísticas. Por exemplo, em qualquer município o número de leis é dezenas ou centenas de vezes maior que o número de leis complementares; na Câmara dos Deputados os PLs são por volta de 3 vezes mais frequentes que os PDCs.
