defmodule SupermarketKata.Stock do


  @type item :: %{key: String.t, price: float}
  @type t :: %SupermarketKata.Stock{items: %{String.t => item}, currency: String.t}
  @enforce_keys [:items, :currency]
  defstruct [:items, :currency]

  alias SupermarketKata.Stock

  @spec parse!(path :: String.t, parse :: (String.t -> Stock.t)) :: Stock.t
  def parse!(path, parse \\ &SupermarketKata.Parser.StockCSV.parse!/1) do
    parse.(path)
  end

  @spec price(key :: String.t, stock :: Stock.t) :: {:ok, float} | {:error, String.t}
  def price(key, %Stock{items: items}) do
    case Map.fetch(items, key) do
      {:ok, item} -> {:ok, item.price}
      :error -> {:error, "item #{key} not found in the stock"}
    end
  end


end