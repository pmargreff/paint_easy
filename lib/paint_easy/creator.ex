defmodule PaintEasy.Creator do
  @moduledoc """
  Module to create new images
  """
  alias PaintEasy.{
    Image,
    Pixel
  }

  @width 1000
  @height 1000
  @default_pixel 0

  @pbm_format %Image{
    code: "P1",
    pixel_limit: 1,
    width: @width,
    height: @height
  }

  @pgm_format %Image{
    code: "P2",
    pixel_limit: 255,
    width: @width,
    height: @height
  }

  def new_pbm(params \\ []) do
    resolution = get_resolution(params)
    pixels = create_pixels(resolution)

    image =
      @pbm_format
      |> Map.merge(resolution)
      |> Map.put(:pixels, pixels)

    {:ok, image}
  end

  def new_pgm(params \\ []) do
    resolution = get_resolution(params)
    pixels = create_pixels(resolution)

    image =
      @pgm_format
      |> Map.merge(resolution)
      |> Map.put(:pixels, pixels)

    {:ok, image}
  end

  defp create_pixels(%{width: width, height: height}) do
    normalized_height = height - 1
    normalized_width = width - 1

    for h <- 0..normalized_height,
        w <- 0..normalized_width,
        do: %Pixel{color: @default_pixel, x: w, y: h}
  end

  defp get_resolution(params) do
    default_resolution = [width: @width, height: @height]

    default_resolution
    |> Keyword.merge(params)
    |> Enum.into(%{})
  end
end
