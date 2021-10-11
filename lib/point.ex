defmodule Point do
  import Math, only: [sqrt: 1, pow: 2]

  defstruct x: 0, y: 0, z: 0

  def distance(point1, point2) do
    sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2) + pow(point2.z - point1.z, 2))
  end
end
