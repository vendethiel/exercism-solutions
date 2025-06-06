defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    {_, res} = {number, ""}
    |> triple(1000, "M")
    |> single(900, "CM")
    |> triple(500, "D")
    |> single(400, "CD")
    |> triple(100, "C")
    |> single(90, "XC")
    |> triple(50, "L")
    |> single(40, "XL")
    |> triple(10, "X")
    |> single(9, "IX")
    |> single(5, "V")
    |> single(4, "IV")
    |> triple(1, "I")
    res
  end

  defp single({number, str}, min, x) do
    if number >= min do
      {number - min, str <> x}
    else
      {number, str}
    end
  end

  defp triple(a, b, c) do
    a
    |> single(b, c)
    |> single(b, c)
    |> single(b, c)
  end
end
