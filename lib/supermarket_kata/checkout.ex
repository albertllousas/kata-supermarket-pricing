defmodule SupermarketKata.Checkout do

  alias SupermarketKata.CartItem

  @spec total(
          cart_items :: [CartItem.t],
          get_price :: (String.t -> {:ok, float} | {:error, String.t})
        ) :: {:ok, float} | {:error, String.t}
  def total(cart_items, get_price) do
    total(cart_items, get_price, {:ok, 0})
  end

  defp total([], _, acc), do: acc

  defp total([head | tail], get_price, {:ok, acc}) do
#    aqui con with? vendra el get_discount or apply discount
    case get_price.(head.key) do
      {:ok, price} -> total(tail, get_price, {:ok, acc + (price * head.quantity)})
      {:error, message} -> {:error, message}
    end
  end



end