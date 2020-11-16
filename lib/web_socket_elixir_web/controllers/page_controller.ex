defmodule WebSocketElixirWeb.PageController do
  use WebSocketElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
