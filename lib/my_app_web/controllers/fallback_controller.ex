defmodule MyAppWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use MyAppWeb, :controller
  alias MyAppWeb.ErrorView
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(MyAppWeb.ErrorView)
    |> render(:"404")
  end

  # def call(conn, {:error, %Ecto.Changeset{}}) do
  #   conn
  #   #|> put_status(:"update_failed")
  #   |> put_view(MyAppWeb.ChangesetView)
  #   |> render(:"error")
  # end
end
