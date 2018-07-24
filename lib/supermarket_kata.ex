defmodule SupermarketKata do

  alias SupermarketKata.CartItem
  alias SupermarketKata.StockItem
  alias SupermarketKata.Checkout




  #  calculate_discount(key,quantity,offers):discount tb sin offers

  def total(cart_items, stock_items) when is_list(cart_items) do
    with get_price_by_key <- fn key -> StockItem.price(key, stock_items) end, # partial function application
         {:ok, currency}  <- StockItem.extract_currency(stock_items),
         {:ok, total}     <- Checkout.total(cart_items, get_price_by_key),
         do: "#{total}#{currency}"
  end

  def total(inline_items, stock_csv_path) do
    with stock_items  <- StockItem.parse_items!(stock_csv_path),
         cart_items   <- CartItem.parse_items!(inline_items),
      do: total(cart_items, stock_items)
  end

end
