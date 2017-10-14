<?php
/**
 * Converte STDIN ou URI em XML normalizado, para fins de preservação digital e checksum.
 * Exemplos de uso com terminal na raiz do projeto:
 *   php src/xml2xcleaned.php  < autoridade.rdf.xml | more
 *   php src/xml2xcleaned.php http://www.lexml.gov.br/vocabulario/autoridade.rdf.xml > data/RDF-v1/autoridade.rdf.xml
 */

// IO

if ($argc<2) $url = 'php://stdin';
else $url = $argv[1];
if (!$url) die("\nERRO: sem input definido\n");

// Process:
$dom = new DOMDocument;
$dom->load($url);
print cleanXML($dom);



// // // // // //
// // // LIB

/**
 * Converte DOMDocument livre em DOMDocument normalizado, limpando espaços e ordenando atributos.
 * @param $dom DOMDocument
 * @output string com XML "limpo".
 */
function cleanXML($dom) {
	$dom->normalizeDocument();
	$xC14N = $dom->documentElement->C14N(); // normalize attribute order, etc.

	$dom2 = new DOMDocument;
	$dom2->preserveWhiteSpace = false; 	// before load
	$dom2->formatOutput = true;      	// any
	$dom2->loadXML($xC14N);
	$dom2->encoding = 'UTF-8';      	// after load
	return $dom2->saveXML(); // documentElement
}

