defmodule PaintEasyTest do
  use ExUnit.Case
  doctest PaintEasy

  test "Create new image" do
    assert {:ok, image} = PaintEasy.new()

    assert image.code == "P2"
    assert image.width == 1000
    assert image.height == 1000
    assert image.pixel_limit == 255
  end
end
