defmodule PXM.CreatorTest do
  @moduledoc false

  alias PXM.{
    Creator,
    Pixel
  }

  use ExUnit.Case
  doctest PXM

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
             ] == pixels |> Enum.to_list()
    end

    test "create new image with default values" do
      assert {:ok, image} = Creator.new_pbm()

      assert image.code == "P1"
      assert image.width == 1000
      assert image.height == 1000
      assert image.pixel_limit == 1
      assert image.pixels |> Enum.to_list() |> length() == 1_000_000
    end

    test "create new image with width and height" do
      width = 10
      height = 10
      assert {:ok, image} = Creator.new_pbm(width: width, height: height)

      assert image.code == "P1"
      assert image.width == width
      assert image.height == height
      assert image.pixel_limit == 1
      assert image.pixels |> Enum.to_list() |> length() == 100
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
             ] == pixels |> Enum.to_list()
    end

    test "create new image with default values" do
      assert {:ok, image} = Creator.new_pgm()

      assert image.code == "P2"
      assert image.width == 1000
      assert image.height == 1000
      assert image.pixel_limit == 255
      assert image.pixels |> Enum.to_list() |> length() == 1_000_000
    end

    test "create new image with width and height" do
      width = 10
      height = 10
      assert {:ok, image} = Creator.new_pgm(width: width, height: height)

      assert image.code == "P2"
      assert image.width == width
      assert image.height == height
      assert image.pixel_limit == 255
      assert image.pixels |> Enum.to_list() |> length() == 100
    end
  end

  describe "new_ppm/2" do
    test "create new image with mapped pixels" do
      width = 2
      height = 2
      assert {:ok, %{pixels: pixels}} = Creator.new_ppm(width: width, height: height)

      assert [
               %Pixel{r: 0, g: 0, b: 0, x: 0, y: 0},
               %Pixel{r: 0, g: 0, b: 0, x: 1, y: 0},
               %Pixel{r: 0, g: 0, b: 0, x: 0, y: 1},
               %Pixel{r: 0, g: 0, b: 0, x: 1, y: 1}
             ] == pixels |> Enum.to_list()
    end

    test "create new image with default values" do
      assert {:ok, image} = Creator.new_ppm()

      assert image.code == "P3"
      assert image.width == 1000
      assert image.height == 1000
      assert image.pixel_limit == 255
      assert image.pixels |> Enum.to_list() |> length() == 1_000_000
    end

    test "create new image with width and height" do
      width = 10
      height = 10
      assert {:ok, image} = Creator.new_ppm(width: width, height: height)

      assert image.code == "P3"
      assert image.width == width
      assert image.height == height
      assert image.pixel_limit == 255
      assert image.pixels |> Enum.to_list() |> length() == 100
    end
  end
end
