defmodule PaintEasy do
  alias PaintEasy.{Image, Pixel, Writer}

  @code "P2"
  @width 1000
  @height 1000
  @pixel_limit 255

  def new_p1(width \\ @width, height \\ @height) do
    new("P1", width, height, 1)
  end

  def new(
        code \\ @code,
        width \\ @width,
        height \\ @height,
        pixel_limit \\ @pixel_limit
      ) do
    image = %Image{
      code: code,
      pixel_limit: pixel_limit,
      height: height,
      width: width,
      pixels: create_matrix(pixel_limit, width, height)
    }

    {:ok, image}
  end

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
