defmodule PaintEasy.Pixel do
  @default_color 255

  @moduledoc """
  Documentation for PaintEasy.Pixel
  """
  defstruct color: @default_color,
            x: 0,
            y: 0
end
