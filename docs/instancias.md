# Instâncias semânticas especializadas

Prefixos de URN LEX com significado diferenciado do fragmento isolado.  

* o "Supremo Tribunal Federal" como termo isolado no vocabulário de autoridades está associado ao conceito [Q32766](https://www.wikidata.org/wiki/Q32766). Quando em prefixo, `br:supremo.tribunal.federal`, assume o identificador exato [Q519138](https://www.wikidata.org/wiki/Q519138).
* Uma Lei Delegada ... 


...

Especialização por períodos ou datas de inicio,  exemplos:
* o Estado da Guanabra (GB), como jurisdição, só pode ser empregado entre 1960 e 1975.
* a autoridade Supremo Tribunal Federal (STF) surgiu em 1890 (antes era Supremo Tribunal de Justiça).


...

Não confundir com instâncias obrigatórias (separadas por `;`) que já expressam em si a taxonomia prevista pelo vocabulário... por exemplo "[município do Brasil](https://www.wikidata.org/wiki/Q3184121)", dado pelo prefixo `br;estado;municipio` 
é uma instância da classe semântica "[município](https://www.wikidata.org/wiki/Q15284)" (só o nome do município).
PS: o nome de município "Bom Jesus" existe em 5 estados, "Bonito" em 4 estados.

## Sintaxe e tabela

São válidos como prefixos `jurisdição:autoridade`, `jurisdicao:autoridade:tipoDocumento`, `::autoridade:tipoDocumento` e `jurisdição::tipoDocumento`.

A tabela contém os campos `<prefixo,intervalo_anos,wdId>`.

