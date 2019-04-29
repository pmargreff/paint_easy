defmodule PaintEasy.Creator do
  @moduledoc """
  Module to create new images
  """
  alias PaintEasy.Image

  @pbm_format %{
    code: "P1",
    pixel_limit: 1
  }

  @width 1000
  @height 1000

  def new_pbm(params \\ []) do
    %{width: width, height: height} = get_resolution(params)
    %{code: code, pixel_limit: pixel_limit} = @pbm_format

    new(code, width, height, pixel_limit)
  end

  defp new(code, width, height, pixel_limit) do
    image = %Image{
      code: code,
      pixel_limit: pixel_limit,
      height: height,
      width: width
    }

    {:ok, image}
  end

  defp get_resolution(params) do
    default_resolution = [width: @width, height: @height]

    default_resolution
    |> Keyword.merge(params)
    |> Enum.into(%{})
  end
end
