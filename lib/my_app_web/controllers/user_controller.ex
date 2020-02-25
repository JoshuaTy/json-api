defmodule MyAppWeb.UserController do
  use MyAppWeb, :controller

  alias MyApp.Auth
  alias MyApp.Auth.User

  action_fallback MyAppWeb.FallbackController

  def index(conn, _params) do
    users = Auth.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    
    case Auth.create_user(user_params) do
      {:ok, %User{} = user} -> 
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("show.json", user: user)

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_view(MyAppWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Auth.get_user!(id)

   
    case Auth.update_user(user, user_params) do
      {:ok, %User{} = user} ->
        render(conn, "show.json", user: user)

      {:error, %Ecto.Changeset{} = changeset} ->
        
        IO.inspect(changeset)
        conn
        #|> put_status(:"update_failed")
        |> put_view(MyAppWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Auth.get_user!(id)

    with {:ok, %User{}} <- Auth.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
