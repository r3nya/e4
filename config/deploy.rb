require 'bundler/capistrano'

set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

default_run_options[:shell] = '/bin/bash'
set :ruby_version, "2.0.0-p0"
set :chruby_config, "~/chruby/share/chruby/chruby.sh"
set :set_ruby_cmd, "source #{chruby_config} && chruby #{ruby_version}"
set(:bundle_cmd) {
  "#{set_ruby_cmd} && exec bundle"
}

set :application, "e4"
set :repository,  "git://github.com/fat0troll/e4.git"
set :scm, :git

set :domain, ENV['TO']
set :deploy_to, ENV['DIR']

set :use_sudo, false

set :deploy_via, :remote_cache

# store uploaded files thru carrierwave from release to release in shared folder
# set :shared_children, shared_children + %w{public/uploads}

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

after 'deploy:update_code', :roles => :app do
	run "rm -f #{current_release}/config/database.yml"
	run "ln -s #{deploy_to}/shared/config/database.yml #{current_release}/config/database.yml"
end

namespace :deploy do
  task :seed do
    run "cd #{current_path}; #{set_ruby_cmd} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
  task :restart do
    run "thin -C #{current_release}/config/#{thin} restart"
  end
  task :start do
    run "thin -C #{current_release}/config/#{thin} start"
  end
  task :stop do
    run "thin -C #{current_release}/config/#{thin} stop"
  end
end
