# make sure you copy this to the parent app's runtime.exs

config :livebook, :root_path, Livebook.Config.root_path!("LIVEBOOK_ROOT_PATH")

if password = Livebook.Config.password!("LIVEBOOK_PASSWORD") do
  config :livebook, authentication_mode: :password, password: password
else
  config :livebook, token: Livebook.Utils.random_id()
end

config :livebook,
       :cookie,
       Livebook.Config.cookie!("LIVEBOOK_COOKIE") || Livebook.Utils.random_cookie()

config :livebook,
       :default_runtime,
       Livebook.Config.default_runtime!("LIVEBOOK_DEFAULT_RUNTIME") ||
         {Livebook.Runtime.ElixirStandalone, []}
