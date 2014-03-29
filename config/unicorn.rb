# -*- encoding : utf-8 -*-
#root = Rails.env.development? ? File.expand_path(File.join(File.dirname(__FILE__), "..")) : "/home/www/code/current"
root = "/home/www/code/current"

working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.mhero_be.sock"

worker_processes 2
timeout 30

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end
