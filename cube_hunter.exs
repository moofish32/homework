defmodule CubeHunter do
  def find_n_cubes(n, starting_value) do
    do_find_n_cubes(n, starting_value, %{}, {0, 0})
  end

  def do_find_n_cubes(n_cubes_to_find, next_value, seen, {n_cubes_to_find, num}) do
    :math.pow(num,3)
  end

  def do_find_n_cubes(n_cubes_to_find, next_value, seen, pos_answer) do
    [updated_seen, {count, num}] = update_seen_and_count(seen, next_value)
    do_find_n_cubes(n_cubes_to_find, next_value + 1, updated_seen, {count, num})
  end

  def cube_and_sort_digits(number) do
    :math.pow(number,3) 
    |> Kernel.round
    |> Integer.to_string 
    |> String.codepoints
    |> Enum.sort
    |> Enum.join
  end

  def update_seen_and_count(dict, new_value) do 
    string_value = cube_and_sort_digits(new_value)
    dict = Dict.update(dict, :"#{string_value}", {1, new_value}, fn {count, first} -> {count + 1, first} end)
    [dict, dict[:"#{string_value}"]]
  end

end

ExUnit.start
defmodule PermuteTest do 
  use ExUnit.Case

  test "given 12 return 12^3 as 1278 as a string" do 
    assert CubeHunter.cube_and_sort_digits(12) == "1278"
  end

  test "given dict and max, update and return dict and {count, first_seen } new max" do 
    seen = %{"125":  {3,5}, "126": {5, 6}}
    [new_dict, {count, num} ] = CubeHunter.update_seen_and_count(seen,5) 
    assert count == 4
  end

  test "345" do 
    a = CubeHunter.find_n_cubes(3, 1)
    IO.puts inspect(a)
    assert :math.pow(345,3) == a
  end

  test "sovles for 5" do 
    a = CubeHunter.find_n_cubes(5,1)
    assert 127035954683 == a
  end
end
