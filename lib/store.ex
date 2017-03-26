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
    "No product found"
  end

  def find_most_expensive(rows) do
    Enum.max_by(rows, &parse_price(&1))
  end

  def apply_discount(rows, disc) do
    Enum.map(rows, &calculate_discount(&1, disc))
  end

  defp parse_price(%{ "price" => price }) do
    price
    |> String.to_float
    |> abs
  end

  def calculate_discount(%{ "name" => name, "price" => price, "category" => category }, disc) do
    %{ "name" => name, "price" => discount(price, disc), "category" => category }
  end

  defp discount(price, disc) do
    new_price = parse_price(%{ "price" => price })
    new_price - (new_price * (disc/100))
  end

  defp sum(rows) do
    Enum.reduce(rows, fn(x,acc) -> x + acc end)
  end
end
