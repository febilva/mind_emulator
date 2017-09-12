defmodule Mindemulator.GameTest do
  use Mindemulator.DataCase

  alias Mindemulator.Game

  describe "challanges" do
    alias Mindemulator.Game.Challange

    @valid_attrs %{quest_no: 42, questin: "some questin"}
    @update_attrs %{quest_no: 43, questin: "some updated questin"}
    @invalid_attrs %{quest_no: nil, questin: nil}

    def challange_fixture(attrs \\ %{}) do
      {:ok, challange} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_challange()

      challange
    end

    test "list_challanges/0 returns all challanges" do
      challange = challange_fixture()
      assert Game.list_challanges() == [challange]
    end

    test "get_challange!/1 returns the challange with given id" do
      challange = challange_fixture()
      assert Game.get_challange!(challange.id) == challange
    end

    test "create_challange/1 with valid data creates a challange" do
      assert {:ok, %Challange{} = challange} = Game.create_challange(@valid_attrs)
      assert challange.quest_no == 42
      assert challange.questin == "some questin"
    end

    test "create_challange/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_challange(@invalid_attrs)
    end

    test "update_challange/2 with valid data updates the challange" do
      challange = challange_fixture()
      assert {:ok, challange} = Game.update_challange(challange, @update_attrs)
      assert %Challange{} = challange
      assert challange.quest_no == 43
      assert challange.questin == "some updated questin"
    end

    test "update_challange/2 with invalid data returns error changeset" do
      challange = challange_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_challange(challange, @invalid_attrs)
      assert challange == Game.get_challange!(challange.id)
    end

    test "delete_challange/1 deletes the challange" do
      challange = challange_fixture()
      assert {:ok, %Challange{}} = Game.delete_challange(challange)
      assert_raise Ecto.NoResultsError, fn -> Game.get_challange!(challange.id) end
    end

    test "change_challange/1 returns a challange changeset" do
      challange = challange_fixture()
      assert %Ecto.Changeset{} = Game.change_challange(challange)
    end
  end
end
