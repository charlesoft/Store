defmodule Store do

  @doc """
  gets rows, parses their prices and
  passes an argument to sum private function
  """
  def sum_prices(rows) do
    Enum.map(rows, &parse_price(&1))
    |> sum
  end

  def find_eletronic([%{"name" => name, "category" => "Eletronic"} | _]) do
    name
  end

  def find_eletronic([_| tail]) do
    find_eletronic(tail)
  end

  def find_eletronic([]) do
    raise "No product found"
  end


  defp parse_price(%{ "price" => price }) do
    price
    |> String.to_float
    |> abs
  end

  defp sum(rows) do
    Enum.reduce(rows, fn(x,acc) -> x + acc end)
  end
end
