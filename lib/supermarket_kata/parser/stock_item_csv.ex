defmodule SupermarketKata.Parser.StockItemCSV do

  alias SupermarketKata.StockItem

  @regex_stock_item ~r/^(?<item>.*),(?<price>\d*(\.\d*)?)(?<currency>.*)$/

  def parse_items!(path) do
    csv_content_rows(path)
    |> Enum.map(&parse_stock_line/1)
  end

  defp csv_content_rows(path) do
    [_ | lines] = File.open!(path, [:utf8])
                  |> IO.stream(:line)
                  |> Stream.map(&String.trim_trailing/1)
                  |> Enum.to_list
    lines
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


end