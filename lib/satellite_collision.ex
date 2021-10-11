defmodule SatelliteCollision do
  @moduledoc """
  Determine if satellites will collide
  """

  @doc """
  Determine if 2 satellites are too close together
  """
  def will_collide?(satellite1, satellite2, threshold) do
    point1 = Satellite.to_cartesian(satellite1)
    point2 = Satellite.to_cartesian(satellite2)
    distance = Point.distance(point1, point2)
    IO.inspect(distance, label: "distance")
    distance <= threshold
  end
end
