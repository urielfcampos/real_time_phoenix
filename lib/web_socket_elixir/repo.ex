defmodule WebSocketElixir.Repo do
  use Ecto.Repo,
    otp_app: :web_socket_elixir,
    adapter: Ecto.Adapters.Postgres
end
