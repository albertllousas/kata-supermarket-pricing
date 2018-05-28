defmodule SupermarketKata do

  alias SupermarketKata.CartItem
  alias SupermarketKata.Stock
  alias SupermarketKata.Checkout


  def total(items = [%CartItem{}], stock = %Stock{}) do
    with {:ok, total} <- Checkout.total(items, &(Stock.price(&1, stock))),
         do: "#{total}#{stock.currency}"
  end

  def total(inline_items, stock_csv_path) do
    with stock <- Stock.parse!(stock_csv_path),
         items <- CartItem.parse_items!(inline_items),
         do: total items, stock
  end




end
