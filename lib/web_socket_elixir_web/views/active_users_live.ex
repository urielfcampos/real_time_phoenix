defmodule WebSocketElixirWeb.ActiveUsersLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    Active users:
    <%= for user <- @active_users do %>
        <li><%= elem(user, 0) %></li>
    <% end %>
    """
  end

  def mount(_params, _body, socket) do
    if connected?(socket), do: Process.send_after(self(), :update, 3000)
    active_users = WebSocketElixirWeb.Presence.list("room:lobby")
    {:ok, assign(socket, :active_users, active_users)}
  end

  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 3000)
    IO.puts("Updating")
    active_users = WebSocketElixirWeb.Presence.list("room:lobby")
    {:noreply, assign(socket, :active_users, active_users)}
  end
end
