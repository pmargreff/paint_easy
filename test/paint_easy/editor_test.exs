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

    test "create an line on image" do
      {:ok, image} = Creator.new_pbm(width: 3, height: 3)

      %{pixels: pixels} = Editor.edit(image, &TestFilters.line/1)
      assert pixels == [0, 0, 0, 1, 1, 1, 0, 0, 0]
    end

    test "create a vertical line on image" do
    end

    test "create a horizontal line on image" do
    end

    test "create a square on image" do
    end
  end
end

defmodule TestFilters do
  @moduledoc """
  Module with simple functions to test image editor
  """
  def line({_pixel, index}) when index >= 3 and index <= 5, do: 1
  def line({pixel, _index}), do: pixel
end
