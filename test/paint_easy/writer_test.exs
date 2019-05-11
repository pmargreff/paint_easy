defmodule PaintEasy.WriterTest do
  @moduledoc """

  """
  alias PaintEasy.{
    Creator,
    Writer
  }

  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "write_image/2" do
    test "write pbm image on file" do
      {:ok, image} = Creator.new_pbm(width: 3, height: 3)

      expected = "P1\n3 3\n1\n0 0 0 0 0 0 0 0 0"

      file_writed = fn ->
        Writer.write_image(image, :stdio)
      end

      assert capture_io(file_writed) == expected
    end
  end
end
