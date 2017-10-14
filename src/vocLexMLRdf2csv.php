<?php
/**
 * Converte STDIN em CSV conforme XPath esperado de RDF do vocabulário LexML.
 *
 * Exemplos de uso com terminal na raiz do projeto:
 *   php src/vocLexMLRdf2csv.php  c < autoridade.rdf.xml | more
 *   php vocLexMLRdf2csv.php c http://www.lexml.gov.br/vocabulario/autoridade.rdf.xml > data/autoridade-v1.csv
 */


// Configs:
$out = 'csv'; // or json-ld
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
if ($argc<2) die("\n ERRO: option c=CSV j=JSON-LD\n");
$mode = ($argv[1]=='j')? 'JSON-LD': 'CSV';
if ($argc<3) $url = 'php://stdin';
else $url = $argv[2];


// Inits:
$dom = new DOMDocument;
$dom->preserveWhiteSpace = false;
$dom->load($url);
$xpath = new DOMXPath($dom);

if ($mode=='JSON-LD') {
	print "\nEM CONSTRUCAO"; // ver toJsonLD()

} else {	// Gerando CSV:
	fputcsv(STDOUT, array_keys($xpathsToGet) );
	foreach ( $dom->getElementsByTagNameNS($NS0,'Concept')  as  $e )
		fputcsv(STDOUT, xqGetStr($xps,$e) );
}


// LIB

function xqGetStr($xpaths,$e) {
	global  $xpath;
	$ret = [];
	foreach($xpaths as $xp) $ret[] = $xpath->evaluate("string($xp)",$e);
	return $ret;
}



function toJsonLd($dom) {
  $all = [
    "@context"=> [
      "dc"=> "http://purl.org/dc/elements/1.1/",
      "dcterms"=> "http://purl.org/dc/terms/",
      "lexml"=> "http://www.lexml.gov.br/voc/br/",
      "rdf"=> "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
      "rdfs"=> "http://www.w3.org/2000/01/rdf-schema#",
      "skos"=> "http://www.w3.org/2008/05/skos#",
      "xsd"=> "http://www.w3.org/2001/XMLSchema#"
    ],
    "@graph"=> []
  ];

  // ... em  construcao ...
}

