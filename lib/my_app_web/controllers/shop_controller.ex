defmodule MyAppWeb.ShopController do
    use MyAppWeb, :controller
  
    alias MyApp.Partner
    alias MyApp.Partner.Shop
  
    action_fallback MyAppWeb.FallbackController
    
        defp load_categories(conn, _) do
            assign(conn, :categories, Partner.list_categories())
        end

      def index(conn, _params) do
          shops = Partner.list_shops()
          render(conn, "index.json", shops: shops)
      end
  
      def create(conn, %{"shop" => shop_params}) do
  
          case Partner.create_shop(shop_params) do
              {:ok, %Shop{} = shop} ->
                  conn
                  |> put_status(:created)
                  |> put_resp_header("location", Routes.shop_path(conn, :show, shop))
                  |> render("show.json", shop: shop)
                  
              {:error, %Ecto.Changeset{} = changeset} ->
                  conn
                  |> put_view(MyAppWeb.ChangesetView)
                  |> render("error.json", changeset: changeset)
          
          
          end
      end
      
      def show(conn, %{"id" => id}) do
          shop = Partner.get_shop!(id)
          render(conn, "show.json", shop: shop)
      end
      
def update(conn, %{"id" => id, "shop" => shop_params}) do
        shop = Partner.get_shop!(id)

        case Partner.update_shop(shop, shop_params) do 
        
            {:ok, %Shop{} = shop} ->
                render(conn, "show.json", shop: shop)

            {:error, %Ecto.Changeset{} = changeset} ->
                conn
                |> put_view(MyAppWeb.ChangesetView)
                |> render("error.json", changeset: changeset)
        end
    end
  
  end