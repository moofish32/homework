defmodule CubeHunter do
  def find_n_cubes(n, starting_value) do
    do_find_n_cubes(n, starting_value, 0, %{}, 0)
  end

  def do_find_n_cubes(n_cubes_to_find, next_value, n_cubes_to_find, seen, max_length) do
    IO.puts "IM DONE"
    key = cube_and_sort_digits(next_value - 1)
    seen[:"#{key}"]
  end

  def do_find_n_cubes(n_cubes_to_find, next_value, current_max, seen, max_length) do
    "IM adding a new number #{next_value} cubed"
    [updated_seen, {count, num}] = update_seen_and_count(seen, next_value)
    IO.puts inspect(updated_seen)
    do_find_n_cubes(n_cubes_to_find, next_value + 1, max(count, current_max), updated_seen, max_length)
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

  # test "I have reached the end when n = max count" do 
  #   assert CubeHunter.do_find_n_cubes(5, 6987987, 5, %{}, 987) == "IM DONE"
  # end

  # test "I am adding a new value" do 
  #   assert CubeHunter.do_find_n_cubes(5, 987987, 1, %{}, 987) == "IM adding a new number 987987 cubed"
  # end
  #
  test "given 12 return 12^3 as 1278 as a string" do 
    assert CubeHunter.cube_and_sort_digits(12) == "1278"
  end

  test "given dict and max, update and return dict and {count, first_seen } new max" do 
    seen = %{"125":  {3,5}, "126": {5, 6}}
    [new_dict, {count, num} ] = CubeHunter.update_seen_and_count(seen,5) 
    IO.puts count
    IO.puts num
    IO.puts inspect(new_dict)
    assert count == 4
  end

  test "345" do 
    a = CubeHunter.find_n_cubes(3, 1)
    IO.puts inspect(a)
    assert true == true
  end
end
