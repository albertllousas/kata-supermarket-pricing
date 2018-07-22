defmodule SupermarketKata.CartItem do

  @type t :: %SupermarketKata.CartItem{key: String.t, quantity: non_neg_integer}
  @enforce_keys [:key, :quantity]
  defstruct [:key, :quantity]

  alias SupermarketKata.CartItem
  alias SupermarketKata.Parser.InlineCartItems

  @spec parse_items!(path :: String.t, parse :: (String.t -> [CartItem.t])) :: [CartItem.t]
  def parse_items!(items, parse \\ &InlineCartItems.parse!/1) do
    parse.(items)
  end


end