defmodule PXM.ReaderTest do
  @moduledoc false

  alias PXM.{
    Pixel,
    Reader
  }

  use ExUnit.Case

  describe "read_file/2" do
    test "read pbm image file on ascii format" do
      fixture_file = File.cwd!() <> "/test/fixtures/ascii_image.pbm"
      assert {:ok, image} = Reader.read_file(fixture_file)
      assert image.code == "P1"
      assert image.width == 3
      assert image.height == 2
      assert image.pixel_limit == 1

      pixels = Enum.to_list(image.pixels)

      assert length(pixels) == 6

      assert pixels == [
               %Pixel{color: 1, x: 0, y: 0},
               %Pixel{color: 0, x: 1, y: 0},
               %Pixel{color: 1, x: 2, y: 0},
               %Pixel{color: 0, x: 0, y: 1},
               %Pixel{color: 1, x: 1, y: 1},
               %Pixel{color: 0, x: 2, y: 1}
             ]
    end

    test "read pgm image file on ascii format" do
      fixture_file = File.cwd!() <> "/test/fixtures/ascii_image.pgm"
      assert {:ok, image} = Reader.read_file(fixture_file)
      assert image.code == "P2"
      assert image.width == 3
      assert image.height == 2
      assert image.pixel_limit == 255

      pixels = Enum.to_list(image.pixels)

      assert length(pixels) == 6

      assert pixels == [
               %Pixel{color: 255, x: 0, y: 0},
               %Pixel{color: 0, x: 1, y: 0},
               %Pixel{color: 255, x: 2, y: 0},
               %Pixel{color: 0, x: 0, y: 1},
               %Pixel{color: 255, x: 1, y: 1},
               %Pixel{color: 0, x: 2, y: 1}
             ]
    end

    test "read ppm image file on ascii format" do
      fixture_file = File.cwd!() <> "/test/fixtures/ascii_image.ppm"
      assert {:ok, image} = Reader.read_file(fixture_file)
      assert image.code == "P3"
      assert image.width == 3
      assert image.height == 2
      assert image.pixel_limit == 255

      pixels = Enum.to_list(image.pixels)

      assert length(pixels) == 6

      assert pixels == [
               %Pixel{r: 255, g: 0, b: 0, x: 0, y: 0},
               %Pixel{r: 0, g: 255, b: 0, x: 1, y: 0},
               %Pixel{r: 0, g: 0, b: 255, x: 2, y: 0},
               %Pixel{r: 255, g: 255, b: 0, x: 0, y: 1},
               %Pixel{r: 255, g: 255, b: 255, x: 1, y: 1},
               %Pixel{r: 0, g: 0, b: 0, x: 2, y: 1}
             ]
    end
  end
end
