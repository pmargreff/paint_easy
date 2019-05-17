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
        image = IO.binread(file, :all)

        [code, width, height | pixels] =
          image
          |> String.split("\n", trim: true)
          |> Enum.join(" ")
          |> String.split()

        pixels = string_to_pixels(code, pixels, String.to_integer(width), String.to_integer(height))

        image = %Image{
          code: code,
          width: String.to_integer(width),
          height: String.to_integer(height),
          pixels: pixels
        }

        {:ok, image}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp string_to_pixels("P3", pixels, width, height) do
    for h <- 0..height - 1,
        w <- 0..width - 1 do
          red = pixels |> Enum.at((h * width * 3) + (w * 3)) |> String.to_integer()
          green = pixels |> Enum.at((h * width * 3) + (w * 3) + 1) |> String.to_integer()
          blue = pixels |> Enum.at((h * width * 3) + (w * 3) + 2) |> String.to_integer()

          %Pixel{r: red, g: green, b: blue, x: w, y: h}
        end
  end

  defp string_to_pixels(_code, pixels, width, height) do
    for h <- 0..height - 1,
        w <- 0..width - 1,
        do: %Pixel{color: pixels |> Enum.at(h * width + w) |> String.to_integer(), x: w, y: h}
  end
end
