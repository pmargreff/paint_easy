defmodule PaintEasy.WriterTest do
  @moduledoc false

  alias PaintEasy.{
    Creator,
    Writer
  }

  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "write_image/2" do
    test "write pbm image on file" do
      {:ok, image} = Creator.new_pbm(width: 3, height: 3)

      file_writed = fn ->
        Writer.write_image(image, :stdio)
      end

      assert capture_io(file_writed) == "P1\n3 3\n1\n0\n0\n0\n0\n0\n0\n0\n0\n0\n"
    end

    test "write pgm image on file" do
      {:ok, image} = Creator.new_pgm(width: 3, height: 3)

      file_writed = fn ->
        Writer.write_image(image, :stdio)
      end

      assert capture_io(file_writed) == "P2\n3 3\n255\n0\n0\n0\n0\n0\n0\n0\n0\n0\n"
    end

    test "write ppm image on file" do
      {:ok, image} = Creator.new_ppm(width: 3, height: 3)

      file_writed = fn ->
        Writer.write_image(image, :stdio)
      end

      assert capture_io(file_writed) ==
               "P3\n3 3\n255\n" <>
                 "0\n0\n0\n0\n0\n0\n0\n0\n0\n" <>
                 "0\n0\n0\n0\n0\n0\n0\n0\n0\n" <>
                 "0\n0\n0\n0\n0\n0\n0\n0\n0\n"
    end
  end
end
