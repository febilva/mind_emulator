defmodule Mindemulator.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias Mindemulator.Repo

  alias Mindemulator.Game.Challange

  @doc """
  Returns the list of challanges.

  ## Examples

      iex> list_challanges()
      [%Challange{}, ...]

  """
  def list_challanges do
    Repo.all(Challange)
  end

  @doc """
  Gets a single challange.

  Raises `Ecto.NoResultsError` if the Challange does not exist.

  ## Examples

      iex> get_challange!(123)
      %Challange{}

      iex> get_challange!(456)
      ** (Ecto.NoResultsError)

  """
  def get_challange!(id), do: Repo.get!(Challange, id)

  @doc """
  Creates a challange.

  ## Examples

      iex> create_challange(%{field: value})
      {:ok, %Challange{}}

      iex> create_challange(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_challange(attrs \\ %{}) do
    %Challange{}
    |> Challange.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a challange.

  ## Examples

      iex> update_challange(challange, %{field: new_value})
      {:ok, %Challange{}}

      iex> update_challange(challange, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_challange(%Challange{} = challange, attrs) do
    challange
    |> Challange.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Challange.

  ## Examples

      iex> delete_challange(challange)
      {:ok, %Challange{}}

      iex> delete_challange(challange)
      {:error, %Ecto.Changeset{}}

  """
  def delete_challange(%Challange{} = challange) do
    Repo.delete(challange)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking challange changes.

  ## Examples

      iex> change_challange(challange)
      %Ecto.Changeset{source: %Challange{}}

  """
  def change_challange(%Challange{} = challange) do
    Challange.changeset(challange, %{})
  end
end
