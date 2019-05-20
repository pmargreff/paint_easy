defmodule PaintEasy.Reader do
  @moduledoc """
  Module responsible to open an image from a file.
  """

  alias PaintEasy.{
    Image,
    Pixel
  }

  def read_file(path) do
    case File.open(path, [:read]) do
      {:ok, file} ->

        %{code: code, width: width} = image_info = decode_header(file)

        pixels = stream_to_pixel(code, IO.stream(file, :line), width)

        image = Map.put(image_info, :pixels, pixels)

        {:ok, image}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp decode_header(file) do
    [code] =
      file
      |> IO.binread(:line)
      |> String.split("\n", trim: true)

    [width, height] =
      file
      |> IO.binread(:line)
      |> String.split("\n", trim: true)
      |> Enum.join(" ")
      |> String.split()

    [pixel_limit] =
      file
      |> IO.binread(:line)
      |> String.split("\n", trim: true)

      %Image{
        code: code,
        width: String.to_integer(width),
        height: String.to_integer(height),
        pixel_limit: String.to_integer(pixel_limit)
      }
  end

  defp stream_to_pixel("P3", stream, width) do
    stream
    |> Stream.map(&String.trim(&1, "\n"))
    |> Stream.chunk_every(3)
    |> Stream.with_index()
    |> Stream.map(&create_rgb_pixel(&1, width))
  end

  defp stream_to_pixel(_, stream, width) do
    stream
    |> Stream.map(&String.trim(&1, "\n"))
    |> Stream.with_index()
    |> Stream.map(&create_pixel(&1, width))
  end

  defp create_rgb_pixel({[r, g, b], index}, width) do
    x = rem(index, width)
    y = div(index, width)

    red = String.to_integer(r)
    green = String.to_integer(g)
    blue = String.to_integer(b)

    %Pixel{r: red, g: green, b: blue, x: x, y: y}
  end

  defp create_pixel({string, index}, width) do
    x = rem(index, width)
    y = div(index, width)
    pixel_value = String.to_integer(string)
    %Pixel{color: pixel_value, x: x, y: y}
  end
end
