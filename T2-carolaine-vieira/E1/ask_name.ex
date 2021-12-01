defmodule AskName do
  def ask() do    
    name = IO.gets("Qual e o seu nome?\n")
    case String.trim(name) do 
      "Carolaine" -> IO.puts("Mesmo nome que eu?")
      _ -> IO.puts("Ola, #{name}! Tudo bem com voce?\n")
    end
  end
end