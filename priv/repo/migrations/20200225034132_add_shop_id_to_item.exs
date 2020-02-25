defmodule MyApp.Repo.Migrations.AddShopIdToItem do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :shop_id, references(:shops, type: :uuid)
    end
  end
end
