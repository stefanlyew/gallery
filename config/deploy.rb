require "rvm/capistrano"
require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/ssh"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/nodejs"
load "config/recipes/postgresql"
#load "config/recipes/rbenv"
load "config/recipes/check"

server "162.243.12.46", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "mtsiran"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rvm_bin_path, "/usr/local/rvm/bin"

set :scm, "git"
set :repository, "git@github.com:stefanlyew/gallery.git"
set :branch, "master"

set :bundle_dir, ''
set :bundle_flags, '--system --quiet'
set :bundle_without,  [:development]

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

before 'deploy:restart', 'deploy:migrate'
after  'deploy',         'deploy:cleanup'


