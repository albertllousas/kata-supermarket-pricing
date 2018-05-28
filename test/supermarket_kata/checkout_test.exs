defmodule SupermarketKata.CheckoutTest do
  use ExUnit.Case

  alias SupermarketKata.Stock
  alias SupermarketKata.Checkout
  alias SupermarketKata.CartItem

  @stock %Stock{
    items: %{
      "Avocado" => %{price: 10.0, key: "Avocado"},
      "Kiwi" => %{price: 6.0,key: "Kiwi"},
      "Potato" => %{price: 2.0, key: "Potato"},
      "Tomato" => %{price: 4.0, key: "Tomato"}
    }, currency: "$"
  }

  test "should calculate the total for a single cart item" do
   total = Checkout.total([%CartItem{key: "Potato", quantity: 2}], &(Stock.price(&1, @stock)))
   assert total == {:ok, 4}
  end

  test "should not calculate a price in the stock given a non existent item key" do
    total = Checkout.total([%CartItem{key: "Non Existent", quantity: 2}], &(Stock.price(&1, @stock)))
    assert total == {:error, "item Non Existent not found in the stock"}

  end


end