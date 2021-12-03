defmodule Functions do
  #Funcao anonima
  mult = fn (a, b) -> a * b end
  mult.(14, 28)

  #Funcao anonima e taquigrafia
  sum = &(&1 + &2)
  sum.(49, 30)

  #Pattern matching  
  handle_result = fn
    {:ok, result} -> IO.puts "Handling result..."
    {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand."
    {:error} -> IO.puts "An error has occurred!"
  end

  #Funcoes nomeadas
  def hello() do
    IO.puts("Tutubom")
  end
end