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

  def write_image(%Image{code: code} = image, file) do
    header = file_header(image)
    IO.binwrite(file, header)

    # File.stream should run faster
    file_stream = IO.stream(file, :line)
    pixel_stream = pixel_stream_to_file(code, image.pixels)

    pixel_stream
    |> Stream.into(file_stream)
    |> Stream.run()
  end

  defp file_header(%{code: code, width: width, height: height, pixel_limit: pixel_limit}),
    do: "#{code}\n#{width} #{height}\n#{pixel_limit}\n"

  defp pixel_stream_to_file("P3", pixels) do
    pixels
    |> Stream.map(fn %{r: red, g: green, b: blue} -> "#{red}\n#{green}\n#{blue}\n" end)
  end

  defp pixel_stream_to_file(_code, pixels) do
    pixels
    |> Stream.map(fn %{color: color} -> "#{color}\n" end)
  end
end
