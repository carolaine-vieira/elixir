defmodule GuessingGame do
  @moduledoc """
  Um modulo com o objeto de advinhar um numero.
  """

  def guess(a, b) when a > b, do: guess(b, a)

  @doc """
  Funcao principal de interacao com o usuario.

  ## Parametros

    - low: inteiro, menor numero.
    - high: inteiro, maior numero.

  ## Exemplo

      iex> GuessingGame.guess(10, 80)

  """
  @spec guess(integer, integer):: String
  def guess(low, high) do 
    answer = IO.gets("Hmm... maybe you're thinking of #{mid(low, high)}?\n")
    case String.trim(answer) do 
      "bigger" -> bigger(low, high)
      "smaller" -> smaller(low, high)
      "yes" -> "I knew I could guess your number!"
      _ -> 
        IO.puts(~s{Type "bigger", "smaller" or "yes"})
        guess(low, high)
    end
  end

  @doc """
  Uma funcao para saber se o numero eh o do meio.

  ## Parametros

    - low: inteiro, menor numero.
    - high: inteiro, maior numero.

  ## Exemplo

      iex> GuessingGame.mid(10, 80)

  """
  @spec mid(integer, integer):: integer
  def mid(low, high) do 
    div(low + high, 2)
  end

  @doc """
  Uma funcao para saber se o numero eh o maior.

  ## Parametros

    - low: inteiro, menor numero.
    - high: inteiro, maior numero.

  ## Exemplo

      iex> GuessingGame.bigger(80, 10)

  """
  @spec bigger(integer, integer):: integer
  def bigger(low, high) do 
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  @doc """
  Uma funcao para saber se o numero eh o menor.

  ## Parametros

    - low: inteiro, menor numero.
    - high: inteiro, maior numero.

  ## Exemplo

      iex> GuessingGame.smaller(10, 80)

  """
  @spec smaller(integer, integer):: integer
  def smaller(low, high) do 
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end