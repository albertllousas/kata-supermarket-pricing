defmodule SupermarketKata do

  alias SupermarketKata.CartItem
  alias SupermarketKata.StockItem
  alias SupermarketKata.Checkout




  #  extract_currency(items)
  #  calculate_discount(key,quantity,offers):discount tb sin offers


  def total(cart_items, stock_items) when is_list(cart_items) do
    with get_price = fn key -> StockItem.price(key, stock_items) end,
         currency = "$",
         {:ok, total} <- Checkout.total(cart_items, get_price),
         do: "#{total}#{currency}"
  end

  def total(inline_items, stock_csv_path) do
    with stock_items <- StockItem.parse_items!(stock_csv_path),
         cart_items <- CartItem.parse_items!(inline_items)
      do

      total(cart_items, stock_items)
    end
  end

end
