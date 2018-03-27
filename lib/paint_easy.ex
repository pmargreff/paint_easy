defmodule PaintEasy do
  alias PaintEasy.Image
  alias PaintEasy.Writer

  @code "P2"
  @width 1000
  @height 1000
  @pixel_limit 255

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
      pixels: create_matrix()
    }

    {:ok, image}
  end

  def write(filepath \\ DateTime.utc_now() |> DateTime.to_string(), %Image{} = image) do
    Writer.create_file(filepath, image)
  end

  defp create_matrix(pixel \\ 255, width \\ @width, height \\ @height) do
    for _ <- 1..height, do: for(_ <- 1..width, do: pixel)
  end
end
