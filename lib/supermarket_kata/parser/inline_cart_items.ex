defmodule SupermarketKata.Parser.InlineCartItems do

  alias SupermarketKata.CartItem


  @parse_item_separator ", "
  @regex_single_cart_item ~r/^(?<quantity>\d) (?<item>[a-zA-Z0-9_]*)$/

  def parse!(cart_string) do
    String.split(cart_string, @parse_item_separator)
    |> Enum.map(&parse_line_item/1)
  end

  defp parse_line_item(line_item) do

    with %{"quantity" => quantity, "item" => key} <- Regex.named_captures(@regex_single_cart_item, line_item),
         {quantity, _} <- Integer.parse quantity
      do
      %CartItem{key: key, quantity: quantity}
    else
      _ -> raise "oops, impossible to parse cart line '#{line_item}'"
    end

  end

end