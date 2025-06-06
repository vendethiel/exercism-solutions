defmodule PhoneNumber do
  @doc """
  Remove formatting from a phone number if the given number is valid. Return an error otherwise.
  """
  @spec clean(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def clean(raw) do
    digits = Regex.scan(~r/\d/, raw) |> List.flatten()
    num = Enum.count(digits)

    off = if num == 11, do: 1, else: 0

    cond do
      Regex.match?(~r/[a-zA-Z@]/, raw) -> {:error, "must contain digits only"}
      num < 10 -> {:error, "must not be fewer than 10 digits"}
      num > 11 -> {:error, "must not be greater than 11 digits"}
      num == 11 && Enum.at(digits, 0) != "1" -> {:error, "11 digits must start with 1"}
      Enum.at(digits, off) == "0" -> {:error, "area code cannot start with zero"}
      Enum.at(digits, off) == "1" -> {:error, "area code cannot start with one"}
      Enum.at(digits, off + 3) == "0" -> {:error, "exchange code cannot start with zero"}
      Enum.at(digits, off + 3) == "1" -> {:error, "exchange code cannot start with one"}
      num == 11 -> {:ok, Enum.join(digits |> Enum.drop(1), "")}
      num == 10 -> {:ok, Enum.join(digits, "")}
    end
  end
end
