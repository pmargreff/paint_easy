defmodule PXM.Image do

  @moduledoc """
  Defines an Image structure.
  """

  @type pixel :: PXM.Pixel.t()

  @type t :: %{
          code: String.t(),
          height: integer(),
          pixel_limit: integer(),
          pixels: Stream.t(list(pixel())),
          width: integer()
        }

  defstruct code: nil,
            height: nil,
            pixel_limit: nil,
            pixels: [],
            width: nil
end
