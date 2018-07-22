defmodule SupermarketKata do

  alias SupermarketKata.CartItem
  alias SupermarketKata.Stock
  alias SupermarketKata.Checkout

  def total(items, stock = %Stock{}) when is_list(items) do
    get_price_by_key = &(Stock.price(&1, stock)) # partial function application
    with {:ok, total} <- Checkout.total(items, get_price_by_key),
         do: "#{total}#{stock.currency}"
  end

  def total(inline_items, stock_csv_path) do
    with stock <- Stock.parse!(stock_csv_path),
         items <- CartItem.parse_items!(inline_items),
         do: total(items, stock)
  end

end
