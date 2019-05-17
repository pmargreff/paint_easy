defmodule PaintEasy.Pixel do
  @default_color 0

  @moduledoc """
  Defines pixel structure.
  """
  defstruct color: @default_color,
            r: @default_color,
            g: @default_color,
            b: @default_color,
            x: 0,
            y: 0
end
