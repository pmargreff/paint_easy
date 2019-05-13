defmodule PaintEasy.CreatorTest do
  @moduledoc false

  alias PaintEasy.{
    Creator,
    Pixel
  }

  use ExUnit.Case
  doctest PaintEasy

  describe "new_pbm/2" do
    test "create new image with mapped pixels" do
      width = 2
      height = 2
      assert {:ok, %{pixels: pixels}} = Creator.new_pbm(width: width, height: height)

      assert [
               %Pixel{color: 0, x: 0, y: 0},
               %Pixel{color: 0, x: 1, y: 0},
               %Pixel{color: 0, x: 0, y: 1},
               %Pixel{color: 0, x: 1, y: 1}
             ] == pixels
    end

    test "create new image with default values" do
      assert {:ok, image} = Creator.new_pbm()

      assert image.code == "P1"
      assert image.width == 1000
      assert image.height == 1000
      assert image.pixel_limit == 1
      assert length(image.pixels) == 1_000_000
    end

    test "create new image with width and height" do
      width = 10
      height = 10
      assert {:ok, image} = Creator.new_pbm(width: width, height: height)

      assert image.code == "P1"
      assert image.width == width
      assert image.height == height
      assert image.pixel_limit == 1
      assert length(image.pixels) == 100
    end
  end

  describe "new_pgm/2" do
    test "create new image with mapped pixels" do
      width = 2
      height = 2
      assert {:ok, %{pixels: pixels}} = Creator.new_pgm(width: width, height: height)

      assert [
               %Pixel{color: 0, x: 0, y: 0},
               %Pixel{color: 0, x: 1, y: 0},
               %Pixel{color: 0, x: 0, y: 1},
               %Pixel{color: 0, x: 1, y: 1}
             ] == pixels
    end

    test "create new image with default values" do
      assert {:ok, image} = Creator.new_pgm()

      assert image.code == "P2"
      assert image.width == 1000
      assert image.height == 1000
      assert image.pixel_limit == 255
      assert length(image.pixels) == 1_000_000
    end

    test "create new image with width and height" do
      width = 10
      height = 10
      assert {:ok, image} = Creator.new_pgm(width: width, height: height)

      assert image.code == "P2"
      assert image.width == width
      assert image.height == height
      assert image.pixel_limit == 255
      assert length(image.pixels) == 100
    end
  end
end
