defmodule SatelliteCollisionTest do
  use ExUnit.Case

  test "will_collide? false if satellites wont collide" do
    satellite1 = %Satellite{
      eccentricity: 0.0001131,
      height: 556.0281731621435,
      latitude: -27.73707947914896,
      longitude: -97.17265433167117
    }

    satellite2 = %Satellite{
      eccentricity: 0.0003191,
      height: 408.25189267837504,
      latitude: -4.444904136046365,
      longitude: 115.67730280679655
    }

    assert SatelliteCollision.will_collide?(satellite1, satellite2, 10) == false
  end

  test "will_collide? true if 2 satellites will collide" do
    satellite1 = %Satellite{
      eccentricity: 0.0001131,
      height: 556.0281731621435,
      latitude: -27.73707947914896,
      longitude: -97.17265433167117
    }

    satellite2 = %Satellite{
      eccentricity: 0.0003191,
      height: 556.0281731621435,
      latitude: -27.73707947914896,
      longitude: -97.17265433167117
    }

    assert SatelliteCollision.will_collide?(satellite1, satellite2, 700) == true
  end

  test "will_collide? true if any satellites will collide" do
    satellites = [
      %Satellite{
        eccentricity: 0.0001131,
        height: 556.0281731621435,
        latitude: -27.73707947914896,
        longitude: -97.17265433167117
      },
      %Satellite{
        eccentricity: 0.0003191,
        height: 556.0281731621435,
        latitude: -27.73707947914896,
        longitude: -97.17265433167117
      },
      %Satellite{
        eccentricity: 0.0003191,
        height: 408.25189267837504,
        latitude: -4.444904136046365,
        longitude: 115.67730280679655
      }
    ]

    assert SatelliteCollision.will_collide?(satellites, 700) == true
  end
end
