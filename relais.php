<?php
	$param = urldecode($_SERVER['QUERY_STRING']);
	$crit = str_replace("&","|", $param);
	//header("Content-type:image/svg+xml");

	$doc_xml = new DOMDocument();
	$doc_xml->load('./universite.xml');
	
	$doc_xsl = new DOMDocument();
	$doc_xsl->load('./plan.xsl');
	
	$proc = new XsltProcessor();
	$proc->importStylesheet($doc_xsl);
	$proc->setParameter(null, 'criteres', $crit);	
	echo $proc->transformToXML($doc_xml);
?>
