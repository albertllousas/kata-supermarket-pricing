defmodule SupermarketKata.StockTest do
  use ExUnit.Case

  alias SupermarketKata.Stock

  @stock %Stock{
    items: %{
      "Avocado" => %{currency: "$", price: 10.0, sku: "Avocado"},
      "Kiwi" => %{currency: "$", price: 6.0,sku: "Kiwi"},
      "Potato" => %{currency: "$", price: 2.0, sku: "Potato"},
      "Tomato" => %{currency: "$", price: 4.0, sku: "Tomato"}
    }
  }

  test "should call the default parse function" do
    stock = Stock.parse("test/resources/stock.csv")
    assert %Stock{} = stock
  end

  test "should find price in the stock given a item sku" do
    price = Stock.price("Potato", @stock)
    assert price == {:ok, 2.0}
  end

  test "should not find a price in the stock given a non existent item sku" do
    price = Stock.price("non existent", @stock)
    assert price == {:error, :item_not_found}
  end

end