defmodule PaintEasy.Editor do
  @moduledoc """
  Proxy to edit images.
  """

  def edit(%{pixels: pixels} = image, filter) do
    new_pixels =
      pixels
      |> Enum.with_index()
      |> Enum.map(fn pixel_with_index -> filter.(pixel_with_index) end)

    Map.put(image, :pixels, new_pixels)
  end
end
