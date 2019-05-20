defmodule PaintEasy.Filters.Pixmap do
  @moduledoc """
  Create a samples about how to write ppm functions for edition.
  """

  @red_grayscale_constant 0.299
  @green_grayscale_constant 0.587
  @blue_grayscale_constant 0.144

  @pixel_limit 255
  def to_grayscale(%{r: red, g: green, b: blue} = pixel, _properties) do
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

  defp set_upper_limit(value) when value > @pixel_limit, do: @pixel_limit
  defp set_upper_limit(value), do: value

  def invert_collor(%{r: red, g: green, b: blue} = pixel, _properties) do
    new_red = @pixel_limit - red
    new_green = @pixel_limit - green
    new_blue = @pixel_limit - blue
    pixel
    |> Map.put(:r, new_red)
    |> Map.put(:g, new_green)
    |> Map.put(:b, new_blue)
  end


  def to_sketch(%{r: red, g: green, b: blue} = pixel, _properties) do
    intensity =  red + green + blue
    |> div(3)
    |> round()

    new_pixel = resolve_scale(intensity)

    pixel
    |> Map.put(:r, new_pixel)
    |> Map.put(:g, new_pixel)
    |> Map.put(:b, new_pixel)
  end

  @high_intensity 140
  @medium_intensity 100
  defp resolve_scale(intensity) when intensity > @high_intensity, do: @pixel_limit
  defp resolve_scale(intensity) when intensity > @medium_intensity, do: 150
  defp resolve_scale(_), do: 0
end
