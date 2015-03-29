server fetch(:application), user: "ubuntu", roles: %w{web app db monitor}
set :rails_env, :staging