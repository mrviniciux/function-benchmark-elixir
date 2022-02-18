defmodule BasicBench do
  use Benchfella
  Benchfella.start()

  bench "++", [a: gen(), b: gen(), c: gen()] do
    a ++ b ++ c
  end

  bench "append", [a: gen(), b: gen(), c: gen()] do
    a |> append(b) |> append(c)
  end

  def append(front, back) when is_list(front) when is_list(back) do
    front
    |> Enum.reverse
    |> Enum.reduce(back, &([&1 | &2]))
  end

  def gen, do: Enum.to_list(1..1000)
end