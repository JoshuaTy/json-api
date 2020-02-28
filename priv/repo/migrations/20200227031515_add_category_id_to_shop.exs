defmodule MyApp.Repo.Migrations.AddCategoryIdToShop do
  use Ecto.Migration

  def change do
    alter table(:shops) do
      add :category_id, references(:categories, type: :uuid)
    end
  end
end
