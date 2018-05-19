defmodule SupermarketKata.Stock do


  @type item :: %{sku: String.t, price: float}
  @type t :: %SupermarketKata.Stock{items: %{String.t => item, currency: String.t}}
  @enforce_keys [:items]
  defstruct [:items, :currency]

  alias SupermarketKata.Stock

  @spec parse(path :: String.t, parse :: (String.t -> Stock.t)) :: Stock.t
  def parse(path, parse \\ &SupermarketKata.StockCSVParser.parse/1) do
    parse.(path)
  end

  @spec price(sku :: String.t, stock :: Stock.t) :: {:ok, float} | {:error, :item_not_found}
  def price(item, %Stock{items: items}) do
    case Map.fetch(items, item) do
      {:ok, item} -> {:ok, item.price}
      :error -> {:error, :item_not_found}
    end
  end


end