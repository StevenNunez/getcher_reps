defmodule GetcherReps.RepresentativeView do
  use GetcherReps.Web, :view

  def render("index.json", %{reps: reps}) do
    reps
  end
end
