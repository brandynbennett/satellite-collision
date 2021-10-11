defmodule SatelliteCollision do
  @moduledoc """
  Determine if satellites will collide
  """

  @doc """
  Determine if 2 satellites are too close together
  """
  def will_collide?(threshold) do
    response = HTTPoison.get!("https://api.spacexdata.com/v4/starlink")

    Jason.decode!(response.body)
    |> Enum.filter(fn item -> item["height_km"] end)
    |> Enum.map(fn item ->
      %Satellite{
        height: item["height_km"],
        latitude: item["latitude"],
        longitude: item["longitude"],
        eccentricity: item["spaceTrack"]["ECCENTRICITY"]
      }
    end)
    |> will_collide?(threshold)
  end

  def will_collide?([], _threshold), do: false

  def will_collide?([satellite1 | other_satellites] = satellites, threshold)
      when is_list(satellites) do
    collision? =
      Enum.any?(other_satellites, fn satellite2 ->
        will_collide?(satellite1, satellite2, threshold)
      end)

    if collision? do
      true
    else
      will_collide?(other_satellites, threshold)
    end
  end

  def will_collide?(satellite1, satellite2, threshold) do
    point1 = Satellite.to_cartesian(satellite1)
    point2 = Satellite.to_cartesian(satellite2)
    distance = Point.distance(point1, point2)
    distance <= threshold
  end
end
