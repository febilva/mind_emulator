defmodule MindemulatorWeb.ChallangeController do
  require IEx

  use MindemulatorWeb, :controller

  alias Mindemulator.Game
  alias Mindemulator.Game.Challange

  # defp multiplication()

  defp test1([list_values,b,c,[d],final_operator]) do
    # IEx.pry
    # operators = ["*","-","+"]
    # opertor = Enum.random(operators)
    [value2] = tl(list_values)
    case final_operator do
      "+" -> %{
        :value1 => hd(list_values),
        :value2 => value2,
        :value3 => d,
        :opertor1 => b,
        :opertor2 => final_operator,
        :result1 => c,
        :result2 => c + d
      }
      "-" -> %{
        :value1 => hd(list_values),
        :value2 => value2,
        :value3 => d,
        :opertor1 => b,
        :opertor2 => final_operator,
        :result1 => c,
        :result2 => c - d
      }
      "*" -> %{
        :value1 => hd(list_values),
        :value2 => value2,
        :value3 => d,
        :opertor1 => b,
        :opertor2 => final_operator,
        :result1 => c,
        :result2 => c * d
      }
      _ -> "no opertors"
    end

  end
  # defp test({first_list,second_list},[_,"*"]) do
  #   # "helloo"
  #   value = [ first_list |  [ "*" | [Enum.reduce(first_lis, 1, fn(x,acc) -> x * acc end ) | second_list] ]]
  #   IEx.pry
  #
  #
  # end
  defp test({first_list,second_list},b) do
    # IEx.pry
      [x,y] = b
      case x do
        "+" -> [ first_list |  [ x | [ Enum.sum(first_list) | [second_list | [y] ]] ]]
        "-" -> [ first_list | [ x |  [hd(first_list) - hd(tl(first_list)) | [second_list | [y] ]] ]]
        "*" -> [ first_list |  [ x | [Enum.reduce(first_list, 1, fn(x,acc) -> x * acc end ) | [second_list | [y] ]] ]]
        _ -> "no operators"
      end
  end
  defp zip_operations([a,b,c]) do
    operators = [["*","-"],["*","+"],["*","*"],["-","-"],["-","+"],["+","-"],["+","+"]]
    random_selected_operators = Enum.take_random(operators,3)
    zip_list  = Enum.zip([a,b,c],random_selected_operators)
    first_iteration = Enum.map(zip_list,fn({x,y}) -> test({a,b}=Enum.split(x,2),y) end)
    second_iteration = Enum.map(first_iteration, fn(x) -> test1(x) end)
    # IEx.pry



  end
  def index(conn, _params) do
    range = 101 .. 999
    random_value =
      range
      |> Enum.random|> Integer.digits
    reverse_value = random_value |> Enum.reverse
    shuffle_value = random_value |> Enum.shuffle

    value = zip_operations([random_value,reverse_value,shuffle_value])

    # value = range
    # |> Enum.random
    # |> Integer.digits
    # |> Enum.split(2)


    # list = [ ["status", ["*", 5], 1, 5], [["+", 6 ], 5, 1], [ ["-", -4], 1, 5] ]
    # value = Enum.map(list, fn f -> create_map(List.flatten(f)) end)
    # question_value = []
    # g = value
    # |> Enum.random()
    # |

    # |> Map.put(a:question,nil)
    # |> value
    # IEx.pry

    render conn, "febi.html", challanges: value
    # IEx.pry
  end

  #
  # def create_map([opertor, total_value, x, y]) do
  #
  #   x_icon = "glyphicon glyphicon-cloud"
  #   y_icon = "glyphicon glyphicon-star"
  #   value = %{
  #     :question_no => %{
  #     :opertor => opertor,
  #     :total_value => total_value,
  #     :x_value => x,
  #     :y_value => y,
  #     :x_icon => x_icon,
  #     :y_icon => y_icon,
  #     :status => nil,
  #   }
  #   }
  # end
  # def create_map([status,opertor, total_value, x, y]) do
  #   x_icon = "glyphicon glyphicon-cloud"
  #   y_icon = "glyphicon glyphicon-star"
  #   value = %{
  #     :question_no => %{
  #     :opertor => opertor,
  #     :total_value => total_value,
  #     :x_value => x,
  #     :y_value => y,
  #     :x_icon => x_icon,
  #     :y_icon => y_icon,
  #     :status => true,
  #   }
  #   }
  #
  # end



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
  # def test("-", x) when hd(x) !=  do
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


# default functions
  # def new(conn, _params) do
  #   changeset = Game.change_challange(%Challange{})
  #   render conn, "new.html", changeset: changeset
  # end
  #
  #
  # def create(conn, %{"challange" => challange_params}) do
  #   case Game.create_challange(challange_params) do
  #     {:ok, challange} ->
  #       conn
  #       |> put_flash(:info, "Challange created successfully.")
  #       |> redirect(to: challange_path(conn, :show, challange))
  #
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render conn, "new.html", changeset: changeset
  #   end
  # end
  #
  #
  # def show(conn, %{"id" => id}) do
  #   challange = Game.get_challange!(id)
  #   render conn, "show.html", challange: challange
  # end
  #
  #
  # def edit(conn, %{"id" => id}) do
  #   challange = Game.get_challange!(id)
  #   changeset = Game.change_challange(challange)
  #   render conn, "edit.html", challange: challange, changeset: changeset
  # end
  #
  #
  # def update(conn, %{"id" => id, "challange" => challange_params}) do
  #   challange = Game.get_challange!(id)
  #   case Game.update_challange(challange, challange_params) do
  #     {:ok, challange} ->
  #       conn
  #       |> put_flash(:info, "Challange updated successfully.")
  #       |> redirect(to: challange_path(conn, :show, challange))
  #
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render conn, "edit.html", challange: challange, changeset: changeset
  #   end
  # end
  #
  #
  # def delete(conn, %{"id" => id}) do
  #   challange = Game.get_challange!(id)
  #   {:ok, _challange} = Game.delete_challange(challange)
  #   conn
  #   |> put_flash(:info, "Challange deleted successfully.")
  #   |> redirect(to: challange_path(conn, :index))
  # end
end
