defmodule MindemulatorWeb.PageController do
  use MindemulatorWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
