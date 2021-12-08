arquivo = IO.gets("File to count the words from: ") |> String.trim()
palavras = File.read!(arquivo) |> String.split(~r{(\\n|[^\w'])+}) |> Enum.filter(fn x -> x != "" end)
palavras |> Enum.count |> IO.puts()