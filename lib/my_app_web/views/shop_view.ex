defmodule MyAppWeb.ShopView do
    use MyAppWeb, :view
    alias MyAppWeb.ShopView

    def render("index.json", %{shops: shops}) do
        %{data: render_many(shops, ShopView, "shop.json")}
    end

    def render("show.json", %{shop: shop}) do
        %{data: render_one(shop, ShopView, "shop.json")}
    end

    def render("shop.json", %{shop: shop}) do
        %{
            id: shop.id,
            name: shop.name,
            address: shop.address,
            #item: render_many(shop.items, MyAppWeb.ItemView, "item.json")
        }
    end

    def render("shop_with_name_only.json", %{shop: shop}) do
        %{
            name: shop.name
        }
    end
end