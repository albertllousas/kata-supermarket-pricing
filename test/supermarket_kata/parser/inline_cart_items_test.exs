defmodule SupermarketKata.Parser.InlineCartItemsTest do
  use ExUnit.Case

  alias SupermarketKata.CartItem

  test "should parse cart from valid line" do
    cart = CartItem.parse_items! "2 Potato, 5 Tomato"
    assert cart == [%CartItem{key: "Potato", quantity: 2}, %CartItem{key: "Tomato", quantity: 5}]
  end

#  test "should parse empty cart from empty line" do
#    cart = CartItem.parse_items! ""
#    assert cart == []
#  end

  test "should fail parsing a cart items from an invalid line" do
    assert_raise RuntimeError, "oops, impossible to parse cart line '2 Potato,5 Tomato'", fn ->
      CartItem.parse_items! "2 Potato,5 Tomato"

    end
  end

  test "should fail parsing a cart items from an invalid item" do
    assert_raise RuntimeError, "oops, impossible to parse cart line 'five Tomato'", fn ->
      CartItem.parse_items! "2 Potato, five Tomato"
    end
  end

end