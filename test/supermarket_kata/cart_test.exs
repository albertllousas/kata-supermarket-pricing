defmodule SupermarketKata.CartTest do
  use ExUnit.Case

  alias SupermarketKata.Cart

  test "should parse cart from string" do
    cart = Cart.parse "2 Potato, 5 Tomato"
    assert cart == %Cart{items: [%{sku: "Potato", quantity: 2},%{sku: "Tomato", quantity: 5}]}
  end

end