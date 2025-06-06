defmodule Pangram do
  @alphabet MapSet.new(?a..?z, fn x -> List.to_string([x]) end)

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    count = sentence
    |> String.downcase
    |> String.graphemes
    |> MapSet.new
    |> MapSet.intersection(@alphabet)
    |> MapSet.size
    count == 26
  end
end
