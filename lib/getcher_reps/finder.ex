defmodule GetcherReps.Finder do
  @api_key Application.get_env(:getcher_reps, :google_api_key)
  @base_url "https://www.googleapis.com/civicinfo/v2/representatives"
  def by_address(address) do
    "#{@base_url}?key=#{@api_key}&address=#{address}"
    |> URI.encode
    |> HTTPoison.get!
    |> get_officials
  end

  def by_lat_long(lat, long) do

  end

  defp get_officials(%HTTPoison.Response{body: body}) do
  parsed = body |> Poison.decode!
  offices = Map.get(parsed, "offices")
  officials = Map.get(parsed, "officials")
  full_officials = Enum.reduce(offices, %{}, fn (office, map) ->
    offs = Enum.map(office["officialIndices"], fn (id) ->
      Enum.at(officials, id)
    end)
    Map.put(map, office["name"], offs)
  end)

  address = Map.get(parsed, "normalizedInput")
  %{address: address, officials: full_officials}
  end
end
