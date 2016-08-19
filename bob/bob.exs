defmodule Bob do
  def hey(input) do
    cond do
      input |> asking? -> "Sure."
      input |> silence? -> "Fine. Be that way!"
      input |> shouting? -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp asking?(input), do: String.ends_with?(input, "?")

  defp silence?(input), do: "" == String.trim(input)

  defp shouting?(input) do
    Regex.match?(~r/\p{L}/u, input) and input == String.upcase(input)
  end
end
