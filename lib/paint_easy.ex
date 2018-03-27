defmodule PaintEasy do
  alias PaintEasy.Image
  alias PaintEasy.Writer

  def new(code \\ "P2", width \\ 1000, height \\ 1000, max \\ 255) do
    image = %Image{
      code: code,
      max: max,
      height: height,
      width: width,
      pixels: create_matrix()
    }

    {:ok, image}
  end

  def write(filepath \\ DateTime.utc_now() |> DateTime.to_string(), image) do
    Writer.create_file(filepath, image)
  end

  defp create_matrix(pixel \\ 255, width \\ 1000, height \\ 1000) do
    for _ <- 1..height, do: for(_ <- 1..width, do: pixel)
  end
end
