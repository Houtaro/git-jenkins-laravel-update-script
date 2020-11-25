#!/bin/bash

cd /var/www/sites/sample

build=false
config_cache=false
composer_install=false
npm_install=false

files_to_pull=$(git fetch -q && git diff --name-only ..origin)

for file in $files_to_pull
do
   if [[ $file =~ \.vue$ || $file =~ \.js$ || $file =~ \.css$ ]]; then
       build=true
   fi

   if [[ ($file == *"config/"* && $file =~ \.php$) || $file == ".env" ]]; then
       config_cache=true
   fi

   if [[ $file == "composer.json" ]]; then
      composer_install=true
   fi

   if [[ $file == "package.json" ]]; then
      npm_install=true
   fi
done


echo "git pull"


if [[ $build = true ]]; then
   echo "npm run prod"
fi

if [[ $config_cache = true ]]; then
   echo "php artisan config:cache"
fi

if [[ $composer_install = true ]]; then
   echo "composer install"
fi

if [[ $npm_install = true ]]; then
   echo "npm install"
fi
