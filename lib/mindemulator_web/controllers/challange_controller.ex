defmodule MindemulatorWeb.ChallangeController do
  require IEx
  use MindemulatorWeb, :controller

  alias Mindemulator.Game
  alias Mindemulator.Game.Challange

  def index(conn, _params) do
    list = [[["*", 5], 1, 5], [["+", 6], 5, 1], [["_", -4], 1, 5]]
    value = Enum.map(list, fn(a) -> create_map(List.flatten(a)) end)
    render(conn, "index.html", challanges: value)
    # IEx.pry
  end
  def create_map([opertor,total_value,x,y]) do
      x_icon = "glyphicon glyphicon-cloud"
      y_icon = "glyphicon glyphicon-star"
      value = %{"opertor" => opertor,
      "total_value" => total_value,
      "x_value" => x,
      "y_value" => y,
      "x_icon" => x_icon,
      "y_icon" => y_icon
    }
  end
  # def question(conn, _params) do
  #
  #   render(conn, "question.html", challanges: &question)
  # end
  # def question(list ) do
  #   a = [ 1,5]
  #   b = Enum.reverse a
  #   list = [a | [a | [b]]]
  #   opertors = ["*","-","+"]
  #   zip_list = Enum.zip(list,opertors)
  #   list_of_value = Enum.map(zip_list, fn(x) -> [test(elem(x, 1),elem(x, 0))|  elem(x, 0) ] end)
  #   value = Enum.shuffle(list_of_value)
  #   # render("index.html",value)
  # end
  # def test("-", x) do
  #   substrated_value = hd(x) - hd(tl(x))
  #   ["_", substrated_value]
  # end
  # def test("+",y) do
  #   sum_value = Enum.sum(y)
  #   ["+", sum_value]
  # end
  # def test("*", x) do
  #   multiplied_value = Enum.reduce(x, 1, fn(x,acc) -> x * acc end )
  #   ["*",multiplied_value]
  # end



  def new(conn, _params) do
    changeset = Game.change_challange(%Challange{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"challange" => challange_params}) do
    case Game.create_challange(challange_params) do
      {:ok, challange} ->
        conn
        |> put_flash(:info, "Challange created successfully.")
        |> redirect(to: challange_path(conn, :show, challange))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    challange = Game.get_challange!(id)
    render(conn, "show.html", challange: challange)
  end

  def edit(conn, %{"id" => id}) do
    challange = Game.get_challange!(id)
    changeset = Game.change_challange(challange)
    render(conn, "edit.html", challange: challange, changeset: changeset)
  end

  def update(conn, %{"id" => id, "challange" => challange_params}) do
    challange = Game.get_challange!(id)

    case Game.update_challange(challange, challange_params) do
      {:ok, challange} ->
        conn
        |> put_flash(:info, "Challange updated successfully.")
        |> redirect(to: challange_path(conn, :show, challange))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", challange: challange, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    challange = Game.get_challange!(id)
    {:ok, _challange} = Game.delete_challange(challange)

    conn
    |> put_flash(:info, "Challange deleted successfully.")
    |> redirect(to: challange_path(conn, :index))
  end
end
