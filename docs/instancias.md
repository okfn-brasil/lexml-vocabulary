# Instâncias semânticas especializadas

Enquanto cada *vocabulário LexML* estabelece uma terminologia controlada com ortografia precisa, mas sem maior precisão no significado do termo (pela sua própria natureza de "termo isoado de contexto"),  a concatenação de dois ou mais termos na URN LEX proporciona o estabelecimento de significados mais precisos, bem como o potencial da realização de estatísticas mais precisas sobre o acervo de codocumentos já acumulados.

Essa concatenação de dois ou mais termos de diferentes vocabulários na URN LEX resulta em diferentes "instâncias semânticas", que por sua vez proporciona o alinhamento destas instâncias com outros vocabulários.

## Contexto

Documentos, como recursos bibliográficos, podem ser identificados de forma única, inclusive por um nome próprio.

O "nome universal do recurso" no contexto LexML, o [URN LEX](https://en.wikipedia.org/wiki/Lex_(URN), é o elemento central dos *padrões LexML*,  garantindo a interoperabilidade e a transparência num sistema que adote esses padrões.  Matérias publicadas por um Diário Oficial  são documentos passíveis de *identificação transparente* por URN LEX.

O URN LEX é superior a outras formas de indentficação por sua transparência, ou seja, por ser composto de metadados típicos de qualquer matéria do Diário Oficial:

* **Agente**: a *autoridade emitente* do documento (tipicamente um ato governamental) faz tanto o papel de autor do documento, como de editor (responsabilidade editorial).  

* **Espaço**: a *jurisdição* da autoirdade emitente determina os limites espaciais da aplicabilidade do ato governamental, ou os limites da sau responsabilidade.

* **Tempo**: num diário oficial toda matéria tem sua *data de publicação*, o que garante obrigatoriamente uma referência de tempo.

* **Finalidade**: os diferentes atos das autoridades possuem as mais diferenetes finalidades e, em função da finalidade devem ser expressos como diferentes *tipos de documento*  (ex. contrato, lei, licitação, portaria).

* **Identificação local**: cada autoridade tem a obrigação de, localmente (na sua jurisdição), dar títulos, nomes ou identificadores  consistentes aos documentos que emite.  <br/>Na ausência de uma identificação local consistente, o diário oficial assume a responsabilidade de identificar cada uma das  matérias daquela data de publicação.

A URN LEX é um nome formado desses cinco componentes principais:

> `urn:lex:`JURISDIÇÃO`:`AUTORIDADE`:`TIPO`:`DATA_E_ID_LOCAL

Exemplos:
```
 urn:lex:br:federal:constituicao:1988-10-05;1988
 urn:lex:br:federal:lei:2008-06-19;11705
 urn:lex:br;sao.paulo;campinas:camara.municipal:resolucao:2011-12-14;866
 urn:lex:br:tribunal.superior.trabalho;turma.4:acordao;rr:2010-12-15;61100-2004-118-8-0
...
```

Os prefixos das URNs LEX são fragmentos iniciais da URN. Nos exemplos `urn:lex:br:federal`, `urn:lex:br:federal:lei`, `urn:lex:br;sao.paulo;campinas:camara.municipal`, etc. são prefixos, podendo ser tomados a partir da jurisdição (`br:federal`, `br:federal:lei`, `br;sao.paulo;campinas:camara.municipal`).

**Prefixos de URN LEX** podem ser melhor caracterizados semanticamente do que os metadados isolados. Fragmentos de `JURISDIÇÃO`:`AUTORIDADE` ou `JURISDIÇÃO`:`AUTORIDADE`:`TIPO` permitem uma caracterização mais precisa, contemplando o [alinhamento do vocabulário LexML com outras ontologias](https://en.wikipedia.org/wiki/Ontology_alignment).


## Exemplos de instâncias jurisdição-autoridade

Exemplos de autoridades:

* A Câmara Municipal de Campinas, `br;sao.paulo;campinas:camara.municipal`, tem semântica bem determinada pelo Wikidata-ID [Q10262936](https://www.wikidata.org/wiki/Q102629). É mais bem determinado do que enquanto o termo genérico `camara.municipal` ([Q102629](https://www.wikidata.org/wiki/Q102629)).

* A Assembleia do Estado de São Paulo, `br;sao.paulo:assembleia`, tem semântica bem determinada pelo Wikidata-ID [Q4808730](https://www.wikidata.org/wiki/Q4808730).

Exemplos de TipoDocumento: ...


## Exemplos de instanciação por período de vigência

... período de vigência do nome ou da entidade nomeada...


Especialização por períodos ou datas de inicio,  exemplos:
* o Estado da Guanabra (GB), como jurisdição, só pode ser empregado entre 1960 e 1975.
* a autoridade Supremo Tribunal Federal (STF) surgiu em 1890 (antes era Supremo Tribunal de Justiça).


...
