defmodule SupermarketKata.StockItem do

  @type t :: %SupermarketKata.StockItem{key: String.t, price: float,  currency: String.t}
  @enforce_keys [:key, :price,:currency]
  defstruct [:key, :price, :currency]

  alias SupermarketKata.StockItem

  @spec parse_items!(path :: String.t, parse :: (String.t -> StockItem.t)) :: [StockItem.t]
  def parse_items!(path, parse \\ &SupermarketKata.Parser.StockItemCSV.parse_items!/1) do
    parse.(path)
  end


#  def extract_currency

  @spec price(key :: String.t, stock_items :: [StockItem.t]) :: {:ok, float} | {:error, String.t}
  def price(key, stock_items) do
    case Enum.find(stock_items, fn(item) -> item.key == key end) do
      nil -> {:error, "item '#{key}' not found in the stock"}
      item -> {:ok, item.price}
    end
  end


end