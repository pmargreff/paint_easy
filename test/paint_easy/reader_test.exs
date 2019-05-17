defmodule PaintEasy.ReaderTest do
  @moduledoc false

  alias PaintEasy.{
    Pixel,
    Reader
  }

  use ExUnit.Case

  describe "read_file/2" do
    @tag dev: true
    test "read pbm image file on ascii format" do
      fixture_file = File.cwd!() <> "/test/fixtures/ascii_image.pbm"
      assert {:ok, image} = Reader.read_file(fixture_file)
      assert image.code == "P1"
      assert image.width == 3
      assert image.height == 2

      assert length(image.pixels) == 6
      assert image.pixels == [
               %Pixel{color: 1, x: 0, y: 0},
               %Pixel{color: 0, x: 1, y: 0},
               %Pixel{color: 1, x: 2, y: 0},
               %Pixel{color: 0, x: 0, y: 1},
               %Pixel{color: 1, x: 1, y: 1},
               %Pixel{color: 0, x: 2, y: 1}
             ]
    end
  end
end
