defmodule MyAppWeb.ItemController do
  use MyAppWeb, :controller

  alias MyApp.Service
  alias MyApp.Service.Item

  action_fallback MyAppWeb.FallbackController
    def index(conn, _params) do
        items = Service.list_items()
        render(conn, "index.json", items: items)
    end

    def create(conn, %{"item" => item_params}) do

        case Service.create_item(item_params) do
            {:ok, %Item{} = item} ->
                conn
                |> put_status(:created)
                |> put_resp_header("location", Routes.item_path(conn, :show, item))
                |> render("show.json", item: item)
                
            {:error, %Ecto.Changeset{} = changeset} ->
                conn
                |> put_view(MyAppWeb.ChangesetView)
                |> render("error.json", changeset: changeset)
        
        
        end
    end
    
    def show(conn, %{"id" => id}) do
        item = Service.get_item!(id)
        render(conn, "show.json", item: item)
    end
    

end