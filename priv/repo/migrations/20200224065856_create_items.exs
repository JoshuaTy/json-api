defmodule MyApp.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :load, :integer
      add :washtype, :string

      timestamps()
    end

  end
end
