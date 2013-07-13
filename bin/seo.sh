#!/bin/bash

sitemap=$1
echo "############## GOOGLE ####################"
echo ""
curl http://google.com/ping?sitemap=${sitemap}
echo ""
echo "############## BING   ####################"
echo ""
curl http://bing.com/ping?sitemap=${sitemap}
echo ""
echo "############## YAHOO  ####################"
echo ""
curl http://yahoo.com/ping?sitemap=${sitemap}
