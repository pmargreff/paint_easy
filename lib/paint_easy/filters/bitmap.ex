defmodule PaintEasy.Filters.Bitmap do
  @moduledoc """
  Create a sample about how to write pbm edition functions
  """

  def horizontal_line({%{y: 1} = pixel, _}), do: Map.put(pixel, :color, 1)
  def horizontal_line({pixel, _}), do: pixel
end
