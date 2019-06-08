defmodule PXM.Pixel do
  @default_color 0

  @moduledoc """
  Defines pixel structure.
  """

  @type t :: %{
          color: integer(),
          r: integer(),
          g: integer(),
          b: integer(),
          x: integer(),
          y: integer(),
        }

  defstruct color: @default_color,
            r: @default_color,
            g: @default_color,
            b: @default_color,
            x: 0,
            y: 0
end
