defmodule MyAppWeb.ItemView do
    use MyAppWeb, :view
    alias MyAppWeb.ItemView

    def render("index.json", %{items: items}) do
        %{data: render_many(items, ItemView, "item_with_shop.json")}
    end

    def render("show.json", %{item: item}) do
        %{data: render_one(item, ItemView, "item.json")}
    end

    def render("item.json", %{item: item}) do
        %{
            id: item.id,
            name: item.name,
            load: item.load,
            washtype: item.washtype,
            shop_id: item.shop_id,
            
            #rendering shop after creating an item will give an error 
            #so i commented this line out 
           # shop: render_one(item.shop, MyAppWeb.ShopView, "shop.json")

            #Line below can get shop's name directly by accessing the variable 
            #shop_name: item.shop.name
        }
    end

    def render("item_with_shop.json", %{item: item}) do
        %{
            id: item.id,
            name: item.name,
            load: item.load,
            washtype: item.washtype,
            shop_id: item.shop_id, 
           shop: render_one(item.shop, MyAppWeb.ShopView, "shop.json")

        }
    end

end