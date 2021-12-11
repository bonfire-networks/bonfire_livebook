import Config

#### Email configuration

# You will almost certainly want to change at least some of these

# include Phoenix web server boilerplate
# import_config "bonfire_web_phoenix.exs"

# include all used Bonfire extensions
import_config "bonfire_livebook.exs"

#### Basic configuration

# You probably won't want to touch these. You might override some in
# other config files.

# Configures the endpoint
config :livebook, LivebookWeb.Endpoint,
  url: [host: "localhost"],
  pubsub_server: Livebook.PubSub,
  live_view: [signing_salt: "livebook"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :mime, :types, %{
  "application/activity+json" => ["activity+json"]
}

# import_config "#{Mix.env()}.exs"
