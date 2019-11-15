set :rails_env, 'production'
set :deploy_to, "/home/master/#{fetch(:application)}"
set :puma_conf, "#{shared_path}/config/puma.rb"
server '54.226.23.8', user: 'master', roles: %w{web app db}