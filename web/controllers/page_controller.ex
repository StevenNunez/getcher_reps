defmodule GetcherReps.PageController do
  use GetcherReps.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
