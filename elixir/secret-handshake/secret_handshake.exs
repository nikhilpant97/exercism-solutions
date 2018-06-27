use Bitwise
defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> Integer.digits(2)
    |> handle()
    |> Enum.reverse()
  end

  def handle(code) when length(code) == 5 do
    case (code) do
      [1 | tail] -> Enum.reverse(handle(tail))
      [0 | tail] -> handle(tail)
    end
  end

  def handle(code)when length(code) == 4 do
    case (code) do
      [1 | tail] -> ["jump" | handle(tail)]
      [0 | tail] -> handle(tail)
    end
  end

  def handle(code) when length(code) == 3 do
    case (code) do
      [1 | tail] -> ["close your eyes" | handle(tail)]
      [0 | tail] -> handle(tail)
    end
  end

  def handle(code) when length(code) == 2 do
    case (code) do
      [1 | tail] -> ["double blink" | handle(tail)]
      [0 | tail] -> handle(tail)
    end
  end

  def handle(code) when length(code) == 1 do
    case (code) do
      [1 | tail] -> ["wink" | handle([])]
      [0 | tail] -> handle([])
    end
  end

  def handle(code) when length(code) < 1 or length(code) > 5, do: []
end
