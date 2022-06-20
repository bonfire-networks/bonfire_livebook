import Config

# make sure you copy the below to the parent app's runtime.exs

if Code.ensure_loaded?(Livebook) do
  Livebook.config_runtime()
end

## bonfire_livebook
# if Code.ensure_loaded?(Livebook.Config) do
#   config :livebook, :root_path, Livebook.Config.root_path!("LIVEBOOK_ROOT_PATH")

#   if password = Livebook.Config.password!("LIVEBOOK_PASSWORD") do
#     config :livebook, authentication_mode: :password, password: password
#   else
#     config :livebook, authentication_mode: :token
#     config :livebook, token: System.get_env("LIVEBOOK_TOKEN", Livebook.Utils.random_id())
#   end

#   config :livebook,
#         :cookie,
#         Livebook.Config.cookie!("LIVEBOOK_COOKIE") || Livebook.Utils.random_cookie()

#   config :livebook,
#         :default_runtime,
#         Livebook.Config.default_runtime!("LIVEBOOK_DEFAULT_RUNTIME") ||
#           {Livebook.Runtime.Embedded, []}

# end
