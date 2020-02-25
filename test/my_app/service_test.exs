defmodule MyApp.ServiceTest do
  use MyApp.DataCase

  alias MyApp.Service

  describe "items" do
    alias MyApp.Service.Item

    @valid_attrs %{load: 42, name: "some name", washtype: "some washtype"}
    @update_attrs %{load: 43, name: "some updated name", washtype: "some updated washtype"}
    @invalid_attrs %{load: nil, name: nil, washtype: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Service.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Service.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Service.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Service.create_item(@valid_attrs)
      assert item.load == 42
      assert item.name == "some name"
      assert item.washtype == "some washtype"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Service.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Service.update_item(item, @update_attrs)
      assert item.load == 43
      assert item.name == "some updated name"
      assert item.washtype == "some updated washtype"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Service.update_item(item, @invalid_attrs)
      assert item == Service.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Service.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Service.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Service.change_item(item)
    end
  end
end
