defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers), do:
    Enum.chunk_every(texts, workers)
    |> Enum.map(&freq_all/1)
    |> Enum.flat_map(&Task.await/1)
    |> Enum.reduce(%{}, &merge/2)

  defp freq_all(segment), do:
    Task.async(fn -> segment |> Enum.map(&freq/1) end)

  defp freq(text), do:
    text
    |> String.replace(~r/[\d\s!?;'\"(),:._-]/, "")
    |> String.downcase
    |> String.graphemes
    |> Enum.frequencies

  defp merge(a, b), do:
    Map.merge(a, b, fn _, x, y -> x + y end)
end
