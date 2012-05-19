require 'rvm/capistrano'
require 'bundler/capistrano'
set :rvm_ruby_string, "ruby-1.9.2-p136"
set :rvm_type, :user

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :user, "luca"
set :use_sudo, false

set :application, "carogoverno"
set :scm, :git
set :repository, "git://github.com/polysics/carogoverno.git"
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

set :deploy_to, "/opt/rails/carogoverno"
set :deploy_via, :remote_cache

role :web, "officineidea.com"                          # Your HTTP server, Apache/etc
role :app, "officineidea.com"                          # This may be the same as your `Web` server
role :db,  "officineidea.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end

after "deploy:update_code", "deploy:pipeline_precompile"
before "deploy:finalize_update", "deploy:symlink_shared"


namespace :deploy do
  desc "Symlinks the shared files as needed"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/email.yml #{release_path}/config/email.yml"
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
  task :pipeline_precompile do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end
end

