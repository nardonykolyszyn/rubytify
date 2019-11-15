# config valid for current version and patch releases of Capistrano
lock "~> 3.11"
set :application, 'rubytify'
set :repo_url, 'git@github.com:nardonykolyszyn/rubytify.git'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public')
set :linked_files, fetch(:linked_files, []).push('.env')
set :rbenv_ruby, '2.5.1'