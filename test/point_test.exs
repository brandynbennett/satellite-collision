defmodule PointTest do
  use ExUnit.Case

  test "distance/2 gets distance between 2 points" do
    point1 = %Point{x: 0, y: 0, z: 0}
    point2 = %Point{x: 1, y: 1, z: 1}

    assert Point.distance(point1, point2) == 1.7320508075688772
  end
end
