<?php

1. io for get folder-name or default data folder
2. scan folder, looking for all CSVs
3. convert each CSV (read and put back)


fputcsv(STDOUT, array_keys($xpathsToGet) );
foreach ( $dom->getElementsByTagNameNS($NS0,'Concept')  as  $e )
	fputcsv(STDOUT, xqGetStr($xps,$e) );
