defmodule SupermarketKata.CheckoutTest do
  use ExUnit.Case

  alias SupermarketKata.Checkout
  alias SupermarketKata.CartItem

  test "should calculate the total for a single cart item" do
    get_price = fn _ -> {:ok, 2.0} end
    total = Checkout.total([%CartItem{key: "Potato", quantity: 2}], get_price)
    assert total == {:ok, 4}
  end

  test "should not calculate a price in the stock given a non existent item key" do
    get_price = fn _ -> {:error, "item 'Non Existent' not found in the stock"} end
    total = Checkout.total([%CartItem{key: "Non Existent", quantity: 2}], get_price)
    assert total == {:error, "item 'Non Existent' not found in the stock"}

  end


end