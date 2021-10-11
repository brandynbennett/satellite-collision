defmodule SatelliteCollisionTest do
  use ExUnit.Case

  test "will_collide? false if satellites wont collide" do
    assert SatelliteCollision.will_collide?() == false
  end
end
