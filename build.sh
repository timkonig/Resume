#!/bin/bash

echo "Creating CSS file ..."

stylec résumé.css.js -o résumé.css

echo "Transforming XML to HTML5 ..."

xsltproc résumé.xsl résumé.xml > index.html

echo "Complete!"