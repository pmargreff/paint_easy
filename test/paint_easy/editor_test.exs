defmodule PaintEasy.EditorTest do
  @moduledoc false

  alias PaintEasy.{
    Creator,
    Editor
  }

  use ExUnit.Case

  describe "edit_image/2" do
    test "paint first pixel on image" do
      {:ok, image} = Creator.new_pbm(width: 3, height: 3)

      fun_filter = fn pixel, _ ->
        case pixel do
          %{x: 0, y: 0} -> Map.put(pixel, :color, 1)
          _ -> pixel
        end
      end

      %{pixels: pixels} = Editor.edit(image, fun_filter)
      pixel_colors = Enum.map(pixels, fn pixel -> Map.get(pixel, :color) end)
      assert pixel_colors == [1, 0, 0, 0, 0, 0, 0, 0, 0]
    end

    test "create horizontal line on image" do
      {:ok, image} = Creator.new_pbm(width: 3, height: 3)

      fun_filter = fn pixel, _ ->
        case pixel do
          %{y: 1} -> Map.put(pixel, :color, 1)
          _ -> pixel
        end
      end

      %{pixels: pixels} = Editor.edit(image, fun_filter)
      pixel_colors = Enum.map(pixels, fn pixel -> Map.get(pixel, :color) end)
      assert pixel_colors == [0, 0, 0, 1, 1, 1, 0, 0, 0]
    end
  end
end
