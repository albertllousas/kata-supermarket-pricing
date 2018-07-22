defmodule SupermarketKata.CartTest do
  use ExUnit.Case

  alias SupermarketKata.CartItem

  test "should call the default parse function" do
    items = CartItem.parse_items! "2 Potato, 5 Tomato"
    assert [%CartItem{}, %CartItem{}] = items
  end

end