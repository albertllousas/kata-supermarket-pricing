defmodule SupermarketKata.Checkout do

  alias SupermarketKata.CartItem

  @spec total(
          cart_items :: [CartItem.t],
          price_extractor :: (String.t -> {:ok, float} | {:error, String.t})
        ) :: {:ok, float} | {:error, String.t}

  def total(cart_items, price_extractor) do
    with {:ok, prices} <- prices(cart_items, price_extractor),
         total <- total_price(cart_items, prices),
      do: {:ok, total}
  end

  defp prices(cart_items, price_extractor) do
    prices = Enum.map cart_items, &(price_extractor.(&1.key))

    #foldr? like sequence
    case Enum.find(prices, fn (p) -> match?({:error, _}, p) end) do
      {:error, message} -> {:error, message}
      _ -> {:ok, Enum.map(prices, &(elem(&1, 1)))}
    end
  end

  defp total_price(cart_items, prices) do

    prices
    |> Enum.zip(cart_items)
    |> List.foldl(0, fn tuple, acc -> elem(tuple, 1).quantity * elem(tuple, 0) + acc end)
  end


end