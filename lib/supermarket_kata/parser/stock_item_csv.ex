defmodule SupermarketKata.Parser.StockItemCSV do

  alias SupermarketKata.StockItem

  @regex_stock_item ~r/^(?<item>.*),(?<price>\d*(\.\d*)?)(?<currency>.*)$/

  def parse_items!(path) do
    csv_content_rows(path)
    |> parse_stock_lines
  end

  defp csv_content_rows(path) do
    [_ | lines] = File.open!(path, [:utf8])
                  |> IO.stream(:line)
                  |> Stream.map(&String.trim_trailing/1)
                  |> Enum.to_list
    lines
  end

  defp parse_stock_lines(lines) do
    Enum.map(lines, &parse_stock_line/1)
  end

  defp parse_stock_line(line) do

    with %{"currency" => currency, "item" => item, "price" => price} <- Regex.named_captures(@regex_stock_item, line),
         {float, _} <- Float.parse price
      do
      %StockItem{key: item, price: float, currency: currency}
    else
      _ -> raise "oops, impossible to parse stock line '#{line}'"
    end
  end

#  defp extract_currency(lines) do
#    currencies = lines
#                 |> Enum.map(&(Regex.named_captures(@regex_stock_item, &1)))
#                 |> Enum.map(&(&1["currency"]))
#
#    if Enum.uniq(currencies)
#       |> Enum.count > 1 do
#      raise "oops, more than one currency in the stock '#{Enum.uniq(currencies)}'"
#    else
#      List.first currencies
#    end
#
#  end

end