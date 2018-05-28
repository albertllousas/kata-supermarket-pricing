defmodule SupermarketKata.StockTest do
  use ExUnit.Case

  alias SupermarketKata.Stock

  @stock %Stock{
    items: %{
      "Avocado" => %{price: 10.0, key: "Avocado"},
      "Kiwi" => %{price: 6.0,key: "Kiwi"},
      "Potato" => %{price: 2.0, key: "Potato"},
      "Tomato" => %{price: 4.0, key: "Tomato"}
    }, currency: "$"
  }

  test "should call the default parse function" do
    stock = Stock.parse!("test/resources/stock.csv")
    assert %Stock{} = stock
  end

  test "should find price in the stock given a item key" do
    price = Stock.price("Potato", @stock)
    assert price == {:ok, 2.0}
  end

  test "should not find a price in the stock given a non existent item key" do
    price = Stock.price("non existent", @stock)
    assert price == {:error, "item non existent not found in the stock"}
  end

end