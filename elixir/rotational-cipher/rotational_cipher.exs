defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(fn(x) -> shift_char(x, shift) end)
    |> to_string()
  end

  def shift_char(code_char, shift) when code_char in ?a..?z,
    do: shift_with_base(code_char, shift, ?a)

  def shift_char(code_char, shift) when code_char in ?A..?Z,
    do: shift_with_base(code_char, shift, ?A)

  def shift_char(code_char, _), do: code_char

  def shift_with_base(code_char, shift, base),
   do: base + rem(code_char + shift - base, 26)
end
