defmodule StoreTest do
  use ExUnit.Case
  doctest Store

  setup do

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

  test "returns 'No product found'", context do
    list = List.delete_at(context[:list],2)
    assert Store.find_eletronic(list) == "No product found"
  end

  test "return the most expensive", context do
    assert Store.find_most_expensive(context[:list]) ==  %{"name" => "Kindle", "price" => "90.0", "category" => "Eletronic"}
  end

  test "apply discount", context do
    list = Store.apply_discount(context[:list], 10)
    first = List.first(list)
    assert first["price"] == 9.00
  end
end
