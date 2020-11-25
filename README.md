# gitlab-jenkins-laravel-update-script

Purpose:

Run commands on a Laravel + Vue project based on modified files.

Use case:

You are using Jenkins to update the code on your server once commits are pushed or merges are closed. You'll be running `git pull && npm run build` to build your Laravel + Vue project, but you don't want to run `npm run build` everytime, as it takes time and consumes server resources. You only want to run it when `css/js/vue` files are changed. This is when the `update-script` comes into play.

The script checks the list of files to be pulled, checks the file extenstion, and set boolean flags in order run commands based on the modified files.
