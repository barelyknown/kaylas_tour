set :stage, :production
set :rails_env, :production

fetch(:default_env).merge!(rails_env: :production)

server '162.243.57.115', user: 'smd', roles: %w{web app db}, port: 63352
