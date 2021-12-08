defmodule WordCount do
  @moduledoc """
  Um modulo para contar palavras.
  """
  
  @doc """
  A funcao em si para contar palavras.

  ## Parametros

    - Para invocar a funcao, nenhum.

  ## Exemplo

      iex> WordCount.count

  """
  @spec count() :: integer
  def count do
    arquivo = IO.gets("File to count the words from: ") |> String.trim()
    palavras = File.read!(arquivo) |> String.split(~r{(\\n|[^\w'])+}) |> Enum.filter(fn x -> x != "" end)
    palavras |> Enum.count |> IO.puts()
  end
end
