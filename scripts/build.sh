#!/bin/sh

# minify
html-minifier --collapse-whitespace --remove-comments --use-short-doctype --minify-css true --minify-js true --input-dir ./mobirise/ --output-dir .tmp/ --file-ext html

# copy
rsync -va ./static/ ./www/
rsync -va ./mobirise/robots.txt ./www/
rsync -va ./mobirise/sitemap.xml ./www/
rsync -va ./mobirise/assets ./www/
rsync -avz --include='*.html' --exclude='*' ./.tmp/ ./www/

HTMLs=(index.html archive.html mission.html)

# typograf
for item in ${HTMLs[*]}
do
  typograf --locale ru,en-US .tmp/"$item" > ./www/"$item"
done

# html replace: remove odd anchors
ANCHOR_REGEX="/<section class=\"engine\"><a.[^]*?<\/a><\/section>/g"
for item in ${HTMLs[*]}
do
  replace-in-file "$ANCHOR_REGEX" "" ./www/"$item" --encoding=utf-8 --isRegex
done

# html replace: insert opensearch
OPENSEARCH_REPLACE_LINK="<meta charset='UTF-8'><link rel='search' type='application/opensearchdescription+xml' title='gotois' href='./opensearch.xml'/>"
for item in ${HTMLs[*]}
do
  replace-in-file '<meta charset="UTF-8">' "$OPENSEARCH_REPLACE_LINK" ./www/"$item" --encoding=utf-8
done

for item in ${HTMLs[*]}
do
  node scripts/replace-links.js ./www/"$item"
done
