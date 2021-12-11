import Config

config :bonfire_livebook,
  disabled: false

# Sets the default authentication mode to token
config :livebook, :authentication_mode, :token

# Sets the default runtime
# Also make sure the configured runtime has
# a synchronous `init` function that takes the
# configured arguments.
config :livebook, :default_runtime, {Livebook.Runtime.Embedded, []}
