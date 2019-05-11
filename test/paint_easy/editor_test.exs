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

      fun_filter = fn {pixel, index} ->
        case index do
          0 -> 1
          _ -> pixel
        end
      end

      %{pixels: pixels} = Editor.edit(image, fun_filter)
      assert pixels == [1, 0, 0, 0, 0, 0, 0, 0, 0]
    end

    test "create vertical line on image" do
      {:ok, image} = Creator.new_pbm(width: 3, height: 3)

      fun_filter = fn {pixel, index} ->
        case index do
          idx when idx >= 3 and idx <= 5 -> 1
          _ -> pixel
        end
      end

      %{pixels: pixels} = Editor.edit(image, fun_filter)
      assert pixels == [0, 0, 0, 1, 1, 1, 0, 0, 0]
    end
  end
end
