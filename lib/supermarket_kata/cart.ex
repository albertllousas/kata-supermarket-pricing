defmodule SupermarketKata.Cart do


  @type cart_item :: %{sku: String.t, quantity: non_neg_integer}
  @type t :: %SupermarketKata.Cart{items: [cart_item]}
  @enforce_keys [:items]
  defstruct [:items]

  alias SupermarketKata.Cart

  def parse(string \\ &default_parse/1) do
    default_parse string
  end

  defp default_parse(string) do

  end
end