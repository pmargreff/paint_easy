defmodule PaintEasy do
  alias PaintEasy.{Image, Pixel, Writer}

  def paint_pixel(%Image{} = image, %Pixel{color: color, x: x, y: y}) do
    new_matrix = generate_new_matrix(image.pixels, color, x, y)
    Map.put(image, :pixels, new_matrix)
  end

  def write(%Image{} = image, filepath \\ DateTime.utc_now() |> DateTime.to_string()) do
    Writer.create_file(filepath, image)
  end

  defp create_matrix(pixel, width, height) do
    for _ <- 1..height, do: for(_ <- 1..width, do: pixel)
  end

  defp generate_new_matrix(pixels, color, x, y) do
    new_line = generate_new_line(pixels, color, x, y)
    List.replace_at(pixels, y, new_line)
  end

  defp generate_new_line(pixels_matrix, color, x, y) do
    Enum.fetch(pixels_matrix, y)
    |> Tuple.to_list()
    |> List.last()
    |> List.replace_at(x, color)
  end
end
