defmodule PaintEasy.Writer do
  alias PaintEasy.Image

  @moduledoc """
  Module to write image file on output device.
  """

  def create_file(image, path) do
    case File.open("#{path}.pbm", [:write]) do
      {:ok, file} ->
        write_image(image, file)
        :ok

      {:error, reason} ->
        "There was an error creating #{path}.pgm: #{reason}"
    end
  end

  def write_image(%Image{} = image, file) do
    IO.binwrite(file, file_header(image))
    IO.binwrite(file, file_body(image))
  end

  defp file_header(%{code: code, width: width, height: height, pixel_limit: pixel_limit}),
    do: "#{code}\n#{width} #{height}\n#{pixel_limit}\n"

  defp file_body(%{pixels: pixels}) do
    pixels
    |> Enum.flat_map(fn %{color: color} -> [color] end)
    |> List.flatten()
    |> Enum.join(" ")
  end
end
