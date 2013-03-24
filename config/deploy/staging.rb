set :thin, "thin-staging.yml"

after 'deploy:update_code', :roles => :app do
	run "ln -s #{deploy_to}/shared/config/thin-staging.yml #{current_release}/config/thin-staging.yml"
end
