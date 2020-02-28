defmodule MyApp.Partner do
  @moduledoc """
  The Partner context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.Partner.Shop
  alias MyApp.Partner.Category
  @doc """
  Returns the list of shops.

  ## Examples

      iex> list_shops()
      [%Shop{}, ...]

  """
  def list_shops do
    # list_shop_with_items_query()
    list_shop_with_category_query()
    |> Repo.all()
    |> Repo.preload([:items])
  end

  # def list_shop_with_items_query do
  #   Repo.preload(Shop, [:items])
  # end

  def list_shop_with_category_query do
    query = from s in Shop,
    join: c in assoc(s, :category),
    where: s.category_id == c.id,
    preload: [:category]

    IO.inspect(query)
  end

  @doc """
  Gets a single shop.

  Raises `Ecto.NoResultsError` if the Shop does not exist.

  ## Examples

      iex> get_shop!(123)
      %Shop{}

      iex> get_shop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shop!(id), do: Repo.get!(Shop, id)

  @doc """
  Creates a shop.

  ## Examples

      iex> create_shop(%{field: value})
      {:ok, %Shop{}}

      iex> create_shop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shop(attrs \\ %{}) do
    %Shop{}
    |> Shop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shop.

  ## Examples

      iex> update_shop(shop, %{field: new_value})
      {:ok, %Shop{}}

      iex> update_shop(shop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shop(%Shop{} = shop, attrs) do
    shop
    |> Shop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shop.

  ## Examples

      iex> delete_shop(shop)
      {:ok, %Shop{}}

      iex> delete_shop(shop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shop(%Shop{} = shop) do
    Repo.delete(shop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shop changes.

  ## Examples

      iex> change_shop(shop)
      %Ecto.Changeset{source: %Shop{}}

  """
  def change_shop(%Shop{} = shop) do
    Shop.changeset(shop, %{})
  end

  def create_category!(name) do
    Repo.insert!(%Category{name: name}, on_conflict: :nothing)
  end

  def list_categories() do
    Category
    |> Repo.all()
  end

end
