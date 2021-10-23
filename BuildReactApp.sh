read -p "What would you like your app to be called:" appname
mkdir $appname
cd $appname

#read -p "What components would you like to create?(separate by spaces)" componentnames

echo "building pages $@"
mainpages=(app\.jsx index\.html index\.js package\.json manifest\.json README\.md)
pages=(Home About Contact Projects)
components=(App Starter)
addMainHtml="<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<link></link>\n\t</head>\n\t<body>\n\t\t<div id='app'></div>\n\t\t<script></script>\n\t</body>\n</html>"

#add lowercase ids to page components
addpageName(){
  lowerCase=${1} 
  lc=$(echo "$lowerCase" | tr '[:upper:]' '[:lower:]')
  echo -e "import React, { useState } from 'react'; \nexport default function(){\n\n\treturn(\n\t\t<div id='"$lc"'></div>\n\t)\n\n};"
}

#add html to index.html
echo -e $addMainHtml > index.html

#build gitignore
echo -e ".DS_Store\n.env\n" > .gitignore

#build .env
echo -e "PW=\nSECRET=" > .env

#add page and component directories
mkdir pages components

#build pages
for page in "${pages[@]}" 
do 
  mkdir pages/${page}
  addpageName "${page}" > pages/${page}/$page.jsx
done

#build starter components
for component in "${components[@]}" 
do   
  addpageName "${component}" > components/$component.jsx
done

#Build the basics
for main in "${mainpages[@]}"
do 
  touch ${main}
done

#add server files
mkdir server
touch server/app.js

echo "Build Complete. Enjoy your web application building process!";