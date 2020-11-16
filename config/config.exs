# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :web_socket_elixir,
  ecto_repos: [WebSocketElixir.Repo]

# Configures the endpoint
config :web_socket_elixir, WebSocketElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hNVXhMzFNcPrW1gYPFFBVXWsI/1wzdLMaETb2N8jNSSDyw6XSKSoZ2r1ul1QAfU9",
  render_errors: [view: WebSocketElixirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WebSocketElixir.PubSub,
  live_view: [signing_salt: "kvvhITx4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
