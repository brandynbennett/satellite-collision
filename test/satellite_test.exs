defmodule SatelliteTest do
  use ExUnit.Case

  test "to_cartesian converts Satellite to cartesian" do
    assert %Satellite{
             eccentricity: 0.0001131,
             height: 556.0281731621435,
             latitude: -27.73707947914896,
             longitude: -97.17265433167117
           }
           |> Satellite.to_cartesian() ==
             %Point{x: 6_378_788.3387902, y: 6_378_787.6845013, z: -3_264_161.1596630514}
  end
end
