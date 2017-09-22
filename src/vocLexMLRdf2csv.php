<?php
/**
 * Converte STDIN em CSV conforme XPath esperado de RDF do vocabulário LexML.
 * Ver fontes em http://dadosabertos.senado.leg.br/dataset/vocabul-rios-controlados-da-urn-lex
 * Exemplos de uso com terminal na raiz do projeto:
 *   php src/vocLexMLRdf2csv.php  < autoridade.rdf.xml | more
 *   php vocLexMLRdf2csv.php http://www.lexml.gov.br/vocabulario/autoridade.rdf.xml > data/autoridade-v1.csv
 */

// Configs:
$NS0 = 'http://www.w3.org/2008/05/skos#';
$xpathsToGet = [
	'about' 	 => '@rdf:about',
	'prefLabel' 	 => 'skos:prefLabel//text()',
	'altLabel' 	 => 'skos:altLabel//text()',
	'broader' 	 => 'skos:broader/@rdf:resource',
	'facetaAcronimo' => 'skos:prefLabel/@lexml:facetaAcronimo',
	'faceta'	 => 'skos:prefLabel/@lexml:faceta',
];
$xps = array_values($xpathsToGet);

// IO
if ($argc<2) $url = 'php://stdin';
else $url = $argv[1];

// Inits:
$dom = new DOMDocument;
$dom->preserveWhiteSpace = false;
$dom->load($url);
$xpath = new DOMXPath($dom);

// Gerando CSV:
fputcsv(STDOUT, array_keys($xpathsToGet) );
foreach ( $dom->getElementsByTagNameNS($NS0,'Concept')  as  $e )
	fputcsv(STDOUT, xqGetStr($xps,$e) );


// LIB

function xqGetStr($xpaths,$e) {
	global  $xpath;
	$ret = [];
	foreach($xpaths as $xp) $ret[] = $xpath->evaluate("string($xp)",$e);
	return $ret;
}

