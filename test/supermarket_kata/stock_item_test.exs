defmodule SupermarketKata.StockTest do
  use ExUnit.Case

  alias SupermarketKata.StockItem

  @stock [
    %StockItem{price: 10.0, key: "Avocado", currency: "$"},
    %StockItem{price: 6.0, key: "Kiwi", currency: "$"},
    %StockItem{price: 2.0, key: "Potato", currency: "$"},
    %StockItem{price: 4.0, key: "Tomato", currency: "$"}
  ]

  test "should call the default parse function" do
    stock = StockItem.parse_items!("test/resources/stock.csv")
    assert length(stock) != 0
  end

  test "should find price in the stock given a item key" do
    price = StockItem.price("Potato", @stock)
    assert price == {:ok, 2.0}
  end

  test "should not find a price in the stock given a non existent item key" do
    price = StockItem.price("non existent", @stock)
    assert price == {:error, "item 'non existent' not found in the stock"}
  end

  test "should extract a currency from stock" do
    result = StockItem.extract_currency(
      [
        %StockItem{price: 10.0, key: "Avocado", currency: "£"},
        %StockItem{price: 6.0, key: "Kiwi", currency: "£"}
      ]
    )
    assert result == {:ok, "£"}

  end

  test "should not succeed extracting a currency from stock with more than one" do
    result = StockItem.extract_currency(
      [
        %StockItem{price: 10.0, key: "Avocado", currency: "$"},
        %StockItem{price: 6.0, key: "Kiwi", currency: "£"}
      ]
    )
    assert result == {:error, "oops, more than one currency in the stock '$£'"}

  end

end