import Config

# NOTE: make sure you also copy the config that needs to go in your app's runtime.exs config

config :bonfire_livebook,
  disabled: false

config :livebook, :base_url_path, "/livebook/"

# Sets the default authentication mode to token
config :livebook, :authentication_mode, :token

# Sets the default runtime
# Also make sure the configured runtime has
# a synchronous `init` function that takes the
# configured arguments.
config :livebook, :default_runtime, {Livebook.Runtime.Embedded, []}
