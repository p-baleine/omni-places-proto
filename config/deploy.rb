#========================
#CONFIG
#========================
set :application, "omni-places-proto"
 
set :scm, :git
set :git_enable_submodules, 1
set :repository, "git@github.com:p-baleine/omni-places-proto.git"
set :branch, "master"
set :ssh_options, { :forward_agent => true }
 
set :stage, :production
set :user, "tajima_junpei"
set :use_sudo, false
set :runner, "deploy"
set :deploy_to, "/var/www/app/#{stage}/#{application}"
set :app_server, :passenger
set :domain, "tajima_junpei@49.212.61.41"
 
#========================
#ROLES
#========================
role :app, domain
role :web, domain
role :db, domain, :primary => true

#========================
#CUSTOM
#========================
 
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end
