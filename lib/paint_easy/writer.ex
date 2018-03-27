defmodule PaintEasy.Writer do
  alias PaintEasy.Image
  alias PaintEasy.Parser

  @moduledoc """
  Documentation for PaintEasy.Writer
  """

  def create_file(path, %Image{} = image) do
    case File.open("#{path}.pgm", [:write]) do
      {:ok, file} ->
        IO.binwrite(file, create_header(:pgm, image.width, image.height, image.max_color))
        IO.binwrite(file, Parser.pixels_to_string(image.pixels))
        :ok

      {:error, reason} ->
        "There was an error creating #{path}.pgm: #{reason}"
    end
  end

  defp create_header(:pgm, width, height, max_color) do
    "P2\n#{width} #{height}\n#{max_color}\n"
  end
end
