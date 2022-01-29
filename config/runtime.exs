import Config

# make sure you copy the below to the parent app's runtime.exs

if Code.ensure_loaded?(Livebook) do
  Livebook.config_runtime()
end
