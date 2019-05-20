defmodule PaintEasy.Filters.PixmapTest do
  @moduledoc false

  alias PaintEasy.{
    Editor,
    Pixel,
    Reader
  }

  alias PaintEasy.Filters.Pixmap, as: Filters

  use ExUnit.Case
  doctest PaintEasy

  describe "reduce_to_grayscale/2" do
    test "reduce colored image to grayscale version" do
      fixture_file = File.cwd!() <> "/test/fixtures/ascii_image.ppm"
      assert {:ok, image} = Reader.read_file(fixture_file)

      %{pixels: pixels} = Editor.edit(image, &Filters.to_grayscale/2)

      assert Enum.to_list(pixels) == [
               %Pixel{r: 76, g: 76, b: 76, x: 0, y: 0},
               %Pixel{r: 150, g: 150, b: 150, x: 1, y: 0},
               %Pixel{r: 37, g: 37, b: 37, x: 2, y: 0},
               %Pixel{r: 226, g: 226, b: 226, x: 0, y: 1},
               %Pixel{r: 255, g: 255, b: 255, x: 1, y: 1},
               %Pixel{r: 0, g: 0, b: 0, x: 2, y: 1}
             ]
    end
  end

  describe "invert_collor/2" do
    @tag dev: true
    test "transform image in the inversion" do
      fixture_file = File.cwd!() <> "/test/fixtures/ascii_image.ppm"
      assert {:ok, image} = Reader.read_file(fixture_file)

      %{pixels: pixels} = Editor.edit(image, &Filters.invert_collor/2)

      assert Enum.to_list(pixels) == [
               %Pixel{r: 0, g: 255, b: 255, x: 0, y: 0},
               %Pixel{r: 255, g: 0, b: 255, x: 1, y: 0},
               %Pixel{r: 255, g: 255, b: 0, x: 2, y: 0},
               %Pixel{r: 0, g: 0, b: 255, x: 0, y: 1},
               %Pixel{r: 0, g: 0, b: 0, x: 1, y: 1},
               %Pixel{r: 255, g: 255, b: 255, x: 2, y: 1}
             ]
    end
  end
end
