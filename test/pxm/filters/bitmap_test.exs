defmodule PXM.Filters.BitmapTest do
  @moduledoc false

  alias PXM.{
    Creator,
    Editor,
    Pixel
  }

  alias PXM.Filters.Bitmap, as: Filters

  use ExUnit.Case
  doctest PXM

  describe "horizontal_line/2" do
    test "create an horizontal line in a small bitmap image" do
      {:ok, image} = Creator.new_pbm(width: 3, height: 3)

      %{pixels: pixels} = Editor.edit(image, &Filters.horizontal_line/2)

      assert Enum.to_list(pixels) == [
               %Pixel{color: 0, x: 0, y: 0},
               %Pixel{color: 0, x: 1, y: 0},
               %Pixel{color: 0, x: 2, y: 0},
               %Pixel{color: 1, x: 0, y: 1},
               %Pixel{color: 1, x: 1, y: 1},
               %Pixel{color: 1, x: 2, y: 1},
               %Pixel{color: 0, x: 0, y: 2},
               %Pixel{color: 0, x: 1, y: 2},
               %Pixel{color: 0, x: 2, y: 2}
             ]
    end
  end
end
