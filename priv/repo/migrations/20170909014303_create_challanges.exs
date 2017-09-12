defmodule Mindemulator.Repo.Migrations.CreateChallanges do
  use Ecto.Migration

  def change do
    create table(:challanges) do
      add :questin, :string
      add :quest_no, :integer

      timestamps()
    end

  end
end
