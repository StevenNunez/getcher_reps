defmodule GetcherReps.RepresentativeController do
  use GetcherReps.Web, :controller
  alias GetcherReps.Finder

  def index(conn, %{"address" => address}) do
    reps = Finder.by_address(address)
    render conn, "index.json", reps: reps
  end
end
