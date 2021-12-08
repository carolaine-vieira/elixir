defmodule AskName do
  @moduledoc """
  Um modulo para interacao com o usuario em busca de saber qual eh o seu nome.
  """

  @doc """
  Uma funcao que pergunta o nome do usuario e comprimenta.
  Caso o usuario tenha o mesmo nome que eu(Carolaine), o comprimento sera diferente.

  ## Parametros

    - nome: String que deve ser apenas o nome do usuario.

  ## Exemplo

      iex> AskName.ask("Marcos")
      "Ola, Marcos! Tudo bem com voce?"

  """
  def ask() do    
    name = IO.gets("Qual e o seu nome?\n")
    case String.trim(name) do 
      "Carolaine" -> IO.puts("Mesmo nome que eu?")
      _ -> IO.puts("Ola, #{name}! Tudo bem com voce?\n")
    end
  end
end