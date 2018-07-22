defmodule SupermarketKata.Parser.StockCSVTest do
  use ExUnit.Case

  alias SupermarketKata.Parser.StockItemCSV, as: Parser

  test "should parse stock from a valid csv" do
    stock_items = Parser.parse_items!("test/resources/stock.csv")
    assert stock_items == [
             %SupermarketKata.StockItem{currency: "$", key: "Potato", price: 2.0},
             %SupermarketKata.StockItem{currency: "$", key: "Tomato", price: 4.0},
             %SupermarketKata.StockItem{currency: "$", key: "Kiwi", price: 6.0},
             %SupermarketKata.StockItem{currency: "$", key: "Avocado", price: 10.0}
           ]

  end

  test "should fail parsing a stock from an invalid csv" do
    assert_raise RuntimeError, "oops, impossible to parse stock line 'Potato2$'", fn ->
      Parser.parse_items!("test/resources/invalid_stock.csv")
    end
  end


end