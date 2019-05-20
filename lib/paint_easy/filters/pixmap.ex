defmodule PaintEasy.Filters.Pixmap do
  @moduledoc """
  Create a samples about how to write ppm functions for edition.
  """

  @red_grayscale_constant 0.299
  @green_grayscale_constant 0.587
  @blue_grayscale_constant 0.144

  def reduce_to_grayscale(%{r: red, g: green, b: blue} = pixel, _properties) do
    gray_pixel =
      (red * @red_grayscale_constant +
         green * @green_grayscale_constant +
         blue * @blue_grayscale_constant)
      |> round()
      |> set_upper_limit()

    pixel
    |> Map.put(:r, gray_pixel)
    |> Map.put(:g, gray_pixel)
    |> Map.put(:b, gray_pixel)
  end

  defp set_upper_limit(value) when value > 255, do: 255
  defp set_upper_limit(value), do: value
end
