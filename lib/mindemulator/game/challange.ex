defmodule Mindemulator.Game.Challange do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mindemulator.Game.Challange


  schema "challanges" do
    field :quest_no, :integer
    field :questin, :string

    timestamps()
  end

  @doc false
  def changeset(%Challange{} = challange, attrs) do
    challange
    |> cast(attrs, [:questin, :quest_no])
    |> validate_required([:questin, :quest_no])
  end
end
