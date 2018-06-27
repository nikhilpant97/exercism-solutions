defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fu) do
    case (list) do
      [] -> []
      [head | tail] ->
        case (fu.(head)) do
          true -> [head | keep(tail, fu)]
          false -> keep(tail, fu)
        end
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fu) do
    case (list) do
      [] -> []
      [head | tail] ->
        case (fu.(head)) do
          true -> discard(tail, fu)
          false -> [head | discard(tail, fu)]
        end
    end
  end
end
