defmodule PaintEasy.CreatorTest do
  alias PaintEasy.Creator

  use ExUnit.Case
  doctest PaintEasy

  describe "new_pbm/2" do
    test "create new image with width and height" do
      width = 10
      height = 10
      assert {:ok, image} = Creator.new_pbm(width: width, height: height)

      assert image.code == "P1"
      assert image.width == width
      assert image.height == height
      assert image.pixel_limit == 1
      assert image.pixel_limit == 1
      assert length(image.pixels) == 100
    end

    test "create new image with default values" do
      assert {:ok, image} = Creator.new_pbm()

      assert image.code == "P1"
      assert image.width == 1000
      assert image.height == 1000
      assert image.pixel_limit == 1
      assert length(image.pixels) == 1_000_000
    end
  end
end
