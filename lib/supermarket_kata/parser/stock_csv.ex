defmodule SupermarketKata.Parser.StockCSV do

  alias SupermarketKata.Stock

  @regex_stock_item ~r/^(?<item>.*),(?<price>\d*(\.\d*)?)(?<currency>.*)$/

  def parse!(path) do
    stock_lines = get_stock_lines path
    %Stock{items: parse_stock_lines(stock_lines), currency: extract_currency(stock_lines)}
  end

  defp get_stock_lines(path) do
    [_ | lines] = File.open!(path, [:utf8])
                 |> IO.stream(:line)
                 |> Stream.map(&String.trim_trailing/1)
                 |> Enum.to_list
    lines
  end

  defp parse_stock_lines(lines) do
    Enum.map(lines, &parse_stock_line/1)
    |> Enum.chunk(1)
    |> Enum.into(%{}, fn [item] -> {item.key, item} end)
  end

  defp parse_stock_line(line) do

    with %{"currency" => _, "item" => item, "price" => price} <- Regex.named_captures(@regex_stock_item, line),
         {float, _} <- Float.parse price
      do
      %{key: item, price: float}
    else
      _ -> raise "oops, impossible to parse stock line '#{line}'"
    end
  end

  defp extract_currency(lines) do
    currencies = lines
                 |> Enum.map(&(Regex.named_captures(@regex_stock_item, &1)))
                 |> Enum.map(&(&1["currency"]))

    if Enum.uniq(currencies)
       |> Enum.count > 1 do
      raise "oops, more than one currency in the stock '#{Enum.uniq(currencies)}'"
    else
      List.first currencies
    end

  end

end