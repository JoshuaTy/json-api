defmodule MyAppWeb.CategoryView do
    use MyAppWeb, :view
    alias MyAppWeb.CategoryView

    def render("category.json", %{category: category}) do
        %{
            id: category.id,
            name: category.name
        }
    end
end