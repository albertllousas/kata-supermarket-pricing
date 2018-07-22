defmodule SupermarketKataTest do
  use ExUnit.Case

  alias SupermarketKata.CartItem
  alias SupermarketKata.StockItem

  test "should calculate the total of an order" do
    total = SupermarketKata.total(
      [%CartItem{key: "Potato", quantity: 2}],
      [%StockItem{key: "Potato", price: 2.0, currency: "$"}]
    )
    assert total == "4.0$"
  end

  test "should calculate the total of a order given a string and a csv" do
    total = SupermarketKata.total("2 Potato, 5 Tomato", "test/resources/stock.csv")
    assert total == "24.0$"
  end

end
