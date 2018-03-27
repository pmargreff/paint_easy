defmodule PaintEasy.Parser do
  @moduledoc """
  Documentation for PaintEasy.Parser
  """

  def pixels_to_string(pixels) do
    List.flatten(pixels) |> Enum.join(" ")
  end
end
