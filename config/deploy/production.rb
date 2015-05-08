set :application, 'www.homeyagency.com'
server fetch(:application), user: "ubuntu", roles: %w{web app db monitor}
set :rails_env, :production