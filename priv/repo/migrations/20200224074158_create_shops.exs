defmodule MyApp.Repo.Migrations.CreateShops do
  use Ecto.Migration

  def change do
    create table(:shops, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :address, :string

      timestamps()
    end

  end
end
