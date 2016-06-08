# config valid only for Capistrano 3.2.1
lock '3.4.0'

set :application, 'travel-link'
set :repo_url, 'git@github.com:bytebutton/trvl.git'
#set :scm, :none
#set :repository, '/home/ubuntu/travel-link/repo'
#set :deploy_via, :copy
set :deploy_to, '/home/ubuntu/travel-link'
set :user, 'ubuntu'
set :use_sudo, false
set :scm, :git
set :branch, :master
set :format, :pretty
set :log_level, :debug
set :pty, true
set :keep_releases, 1
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

# CAPISTRANO RVM CONFIGS
set :default_env, :rvm_bin_path => '~/.rvm/bin'
# set :rvm_ruby_version, '2.1.2@travel-link'
set :rvm_ruby_version, '2.2.1@travel-link'

# CAPISTRANO BUNDLER CONFIGS
set :bundle_flags, '--deployment'

# task :notify_rollbar do
#   on roles(:app) do |h|
#     revision = `git log -n 1 --pretty=format:"%H"`
#     local_user = `whoami`
#     rollbar_token = 'de5c821729944d41a761df38791f673c'
#     rails_env = fetch(:rails_env, 'production')
#     execute "curl https://api.rollbar.com/api/1/deploy/ -F access_token=#{rollbar_token} -F environment=#{rails_env} -F revision=#{revision} -F local_username=#{local_user} >/dev/null 2>&1", :once => true
#   end
# end
#
# after :deploy, 'notify_rollbar'
