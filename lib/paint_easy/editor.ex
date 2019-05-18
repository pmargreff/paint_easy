defmodule PaintEasy.Editor do
  @moduledoc """
  Proxy to edit images.
  """

  def edit(%{pixels: pixels} = image, filter) do
    new_pixels = Enum.map(pixels, fn pixel -> filter.(pixel) end)

    Map.put(image, :pixels, new_pixels)
  end
end
