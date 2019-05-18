defmodule PaintEasy.Filters.Bitmap do
  @moduledoc """
  Create a sample about how to write pbm edition functions
  """

  def horizontal_line(%{y: y} = pixel, %{height: height}) when div(height, 2) == y,
    do: Map.put(pixel, :color, 1)

  def horizontal_line(pixel, _), do: pixel
end
