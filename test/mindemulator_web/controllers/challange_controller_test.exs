defmodule MindemulatorWeb.ChallangeControllerTest do
  use MindemulatorWeb.ConnCase

  alias Mindemulator.Game

  @create_attrs %{quest_no: 42, questin: "some questin"}
  @update_attrs %{quest_no: 43, questin: "some updated questin"}
  @invalid_attrs %{quest_no: nil, questin: nil}

  def fixture(:challange) do
    {:ok, challange} = Game.create_challange(@create_attrs)
    challange
  end

  describe "index" do
    test "lists all challanges", %{conn: conn} do
      conn = get conn, challange_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Challanges"
    end
  end

  describe "new challange" do
    test "renders form", %{conn: conn} do
      conn = get conn, challange_path(conn, :new)
      assert html_response(conn, 200) =~ "New Challange"
    end
  end

  describe "create challange" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, challange_path(conn, :create), challange: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == challange_path(conn, :show, id)

      conn = get conn, challange_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Challange"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, challange_path(conn, :create), challange: @invalid_attrs
      assert html_response(conn, 200) =~ "New Challange"
    end
  end

  describe "edit challange" do
    setup [:create_challange]

    test "renders form for editing chosen challange", %{conn: conn, challange: challange} do
      conn = get conn, challange_path(conn, :edit, challange)
      assert html_response(conn, 200) =~ "Edit Challange"
    end
  end

  describe "update challange" do
    setup [:create_challange]

    test "redirects when data is valid", %{conn: conn, challange: challange} do
      conn = put conn, challange_path(conn, :update, challange), challange: @update_attrs
      assert redirected_to(conn) == challange_path(conn, :show, challange)

      conn = get conn, challange_path(conn, :show, challange)
      assert html_response(conn, 200) =~ "some updated questin"
    end

    test "renders errors when data is invalid", %{conn: conn, challange: challange} do
      conn = put conn, challange_path(conn, :update, challange), challange: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Challange"
    end
  end

  describe "delete challange" do
    setup [:create_challange]

    test "deletes chosen challange", %{conn: conn, challange: challange} do
      conn = delete conn, challange_path(conn, :delete, challange)
      assert redirected_to(conn) == challange_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, challange_path(conn, :show, challange)
      end
    end
  end

  defp create_challange(_) do
    challange = fixture(:challange)
    {:ok, challange: challange}
  end
end
