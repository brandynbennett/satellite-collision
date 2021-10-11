defmodule Ellipsoid do
  import Math, only: [sqrt: 1, sin: 1, cos: 1, pow: 2]
  defstruct latitude: 0, longitude: 0, eccentricity: 0, height: 0

  @earth_semimajor_axis 6_378_137

  def to_cartesian(%Ellipsoid{} = ellipsoid) do
    %{x: x(ellipsoid), y: y(ellipsoid), z: z(ellipsoid)}
  end

  defp x(ellipsoid) do
    n = prime_vertical_radius(ellipsoid)
    n + ellipsoid.height + cos(ellipsoid.latitude) * cos(ellipsoid.longitude)
  end

  defp y(ellipsoid) do
    n = prime_vertical_radius(ellipsoid)
    n + ellipsoid.height + cos(ellipsoid.latitude) * sin(ellipsoid.longitude)
  end

  defp z(ellipsoid) do
    n = prime_vertical_radius(ellipsoid)
    ((1 - ellipsoid.eccentricity) * n + ellipsoid.height) * sin(ellipsoid.latitude)
  end

  defp prime_vertical_radius(%Ellipsoid{eccentricity: eccentricity, latitude: latitude}) do
    @earth_semimajor_axis / sqrt(1 - eccentricity * pow(sin(latitude), 2))
  end
end
