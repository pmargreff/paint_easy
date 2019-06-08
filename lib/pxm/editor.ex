defmodule PXM.Editor do
  @moduledoc """
  Proxy to edit images.
  """

  def edit(%{pixels: pixels} = image, filter) do
    new_pixels = Stream.map(pixels, fn pixel -> filter.(pixel, image) end)

    Map.put(image, :pixels, new_pixels)
  end
end
