# config valid only for Capistrano 3.1
lock '3.1.0'

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
#set :linked_files, %w{config/mongoid.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :unicorn do
  task :stop do
    on roles(:app) do 
      within("#{current_path}") do
        pid = capture "cat #{current}/tmp/pids/unicorn.pid"
        execute "kill -HUP #{pid}"
      end
    end
  end

  task :start do
    on roles(:app) do 
      within("#{current_path}") do
        execute "BUNDLE_GEMFILE=#{current_path}/Gemfile bundle exec unicorn_rails -c #{current_path}/config/unicorn.rb -D"
      end
    end
  end

  task :restart do
    on roles(:app) do 
      within("#{current_path}") do
        if test("[ -f #{current_path}/tmp/pids/unicorn.pid ]")
          pid = capture "cat #{current_path}/tmp/pids/unicorn.pid"
          execute "kill -HUP #{pid}" if pid
          execute "rm #{current_path}/tmp/pids/unicorn.pid"
        end
        execute "BUNDLE_GEMFILE=#{current_path}/Gemfile bundle exec unicorn_rails -c #{current_path}/config/unicorn.rb -D"
      end
    end
  end
end

namespace :deploy do
  desc "asset_compile"
  task :asset_compile do
    on roles(:app) do 
      within("#{current_path}") do
        execute "cd #{current_path} && BUNDLE_GEMFILE=#{current_path}/Gemfile rake assets:precompile"
      end
    end
  end

  task :bundle_update do
    on roles(:app) do 
      within("#{current_path}") do
        execute "BUNDLE_GEMFILE=#{current_path}/Gemfile bundle install --local"
      end
    end
  end

  after "deploy:published", "deploy:bundle_update"
  after "deploy:published", "deploy:asset_compile"
  after "deploy:published", "unicorn:restart"

end
