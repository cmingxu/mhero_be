# config valid only for Capistrano 3.1
lock '3.1.0'

require 'capistrano-unicorn'
unicorn_env = "#{current_path}/config/unicorn"

set :application, 'mhero_be'
set :repo_url, 'git@github.com:cmingxu/mhero_be.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/www/code'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/mongoid.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
  after 'deploy:restart', 'unicorn:restart'   # app preloaded
  after 'deploy:restart', 'unicorn:duplicate'

end