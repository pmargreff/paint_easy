defmodule PaintEasy.Writer do
  alias PaintEasy.Image
  alias PaintEasy.Parser

  @moduledoc """
  Documentation for PaintEasy.Writer
  """

  def create_file(
        path,
        %Image{height: height, pixel_limit: pixel_limit, pixels: pixels, width: width}
      ) do
    case File.open("#{path}.pgm", [:write]) do
      {:ok, file} ->
        IO.binwrite(file, create_header(:pgm, width, height, pixel_limit))
        IO.binwrite(file, Parser.pixels_to_string(pixels))
        :ok

      {:error, reason} ->
        "There was an error creating #{path}.pgm: #{reason}"
    end
  end

  defp create_header(:pgm, width, height, max_color) do
    "P2\n#{width} #{height}\n#{max_color}\n"
  end
end
