# lexml-vocabulary
Vocabulário RDF do LexML



, coforme estabelecido em 

O Comitê Central para a Atribuição de Nomes

RDF vocabulary of LexML, revision and ontology-alignment with Wikidata and others

Vocabulário inspirado no padrão RDA, https://en.wikipedia.org/wiki/Resource_Description_and_Access
 
## Vocabulários e Rregras em vigor

A [versão 1.0 da Parte 6 do LexML](http://projeto.lexml.gov.br/documentacao/Parte-6-Vocabularios-Controlados.pdf), estabelece, resumidamente:

1. Os vocabulários são aqueles definidos nas seções 2 e 3 como "2.1 Natureza do Conteúdo" (`tipoConteudo`), "2.2 Língua" (`lingua`),  "2.3 Evento" (`evento`),  "3.1 Localidade" (`localidade`),  "3.2 Autoridade" (`autoridade`) e  "3.3 Tipo de Documento" (`tipoDocumento`), 
disponíveis em [dadosabertos.senado.leg.br](http://dadosabertos.senado.leg.br/dataset/vocabul-rios-controlados-da-urn-lex)  e definidos como 

A expansão da sigla "stf" para o termo uniforme "supremo.tribunal.federal" já ocorre e é baseada no vocabulário de autoridades emitentes. Não há contudo uma regra que defina sua validade temporal. Sucessor do Supremo Tribunal de Justiça (STF de 1822), o termo STF passou a vigorar em 1890, após a proclamação da República. Essa aobordagem de datação todavia não é válida para o conceito genérico de Supremo Tribunal, [Q32766](https://www.wikidata.org/wiki/Q32766), mas apenas para as instâncias do conceito fixadas por uma jurisdição: no caso "br;stf" é o conceito [Q519138](https://www.wikidata.org/wiki/Q519138).

## Rregras adicionadas

Já a exanção de siglas dentro de uma hierarquia são restritas à hierarquia. Nas jurisdições a hierarquia Brasil é essencial para definir por exemplo os Estados. A expansão de "br;sp" para "br;sao.paulo" pode ser acrescentada no vocabulário LexML em função da sua relevância como norma ISO e sua vasta utilização. A inclusão de nomes anteriores, como "Estado da Guanabara" (GB) também vale, observando-se a regra da datação (existiu apenas entre 1960 e 1975). 



PS: registrar em http://metadataregistry.org/


