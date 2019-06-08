defmodule PXM.Creator do
  @moduledoc """
  Module to create new images
  """
  alias PXM.{
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

  @ppm_format %Image{
    code: "P3",
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

  def new_ppm(params \\ []) do
    resolution = get_resolution(params)
    pixels = create_pixels(resolution)

    image =
      @ppm_format
      |> Map.merge(resolution)
      |> Map.put(:pixels, pixels)

    {:ok, image}
  end

  defp create_pixels(%{width: width, height: height}) do
    total_size = width * height

    Stream.unfold(0, fn
      ^total_size ->
        nil

      acc ->
        x = rem(acc, width)
        y = div(acc, width)
        {%Pixel{color: @default_pixel, x: x, y: y}, acc + 1}
    end)
  end

  defp get_resolution(params) do
    default_resolution = [width: @width, height: @height]

    default_resolution
    |> Keyword.merge(params)
    |> Enum.into(%{})
  end
end
