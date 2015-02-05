defmodule CubeHunter do
  def find_n_cubes(n, starting_value) do
    do_find_n_cubes(n, starting_value, 0, %{}, 0)
  end

  def do_find_n_cubes(n_cubes_to_find, next_value, n_cubes_to_find, seen, max_length) do
    "IM DONE"
  end

  def do_find_n_cubes(n_cubes_to_find, next_value, current_max, seen, max_length) do
    "IM adding a new number #{next_value} cubed"
  end

  def cube_and_sort_digits(number) do
    :math.pow(12,3) 
    |> Kernel.round
    |> Integer.to_string 
    |> String.codepoints
    |> Enum.sort
    |> Enum.join
  end

end

ExUnit.start
defmodule PermuteTest do 
  use ExUnit.Case

  test "I have reached the end when n = max count" do 
    assert CubeHunter.do_find_n_cubes(5, 6987987, 5, %{}, 987) == "IM DONE"
  end

  test "I am adding a new value" do 
    assert CubeHunter.do_find_n_cubes(5, 987987, 1, %{}, 987) == "IM adding a new number 987987 cubed"
  end

  test "given 12 return 12^3 as 1278 as a string" do 
    assert CubeHunter.cube_and_sort_digits(12) == "1278"
  end
end
