defmodule MyApp.Partner.Shop do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "shops" do
    field :address, :string
    field :name, :string

    has_many :items, MyApp.Service.Item
    timestamps()
  end

  @doc false
  def changeset(shop, attrs) do
    shop
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
