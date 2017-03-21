defmodule StoreTest do
  use ExUnit.Case
  doctest Store

  setup do
    IO.puts "List created!"

    [list: [
             %{"name" => "Programing Elixir", "price" => "10.00", "category" => "Book"},
             %{"name" => "Ruby on Rails", "price" => "59.90", "category" => "Book"},
             %{"name" => "Kindle", "price" => "90.0", "category" => "Eletronic"}
           ]]
  end


  test "sum product prices", context do
    assert Store.sum_prices(context[:list]) == 159.90
  end

  test "return eletronic product", context do
    assert Store.find_eletronic(context[:list]) == "Kindle"
  end
end
