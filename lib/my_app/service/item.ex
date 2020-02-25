defmodule MyApp.Service.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "items" do
    field :load, :integer
    field :name, :string
    field :washtype, :string
    belongs_to :shop, MyApp.Partner.Shop
    
    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :load, :washtype, :shop_id])
    |> validate_required([:name, :load, :washtype])
    |> assoc_constraint(:shop)
  end
end
