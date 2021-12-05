defmodule Todo do
  def start do
    filename = IO.gets("Name of .csv to load: ") |> String.trim
    read(filename)
  end

  def get_command(data) do
    prompt = """
    Type the first letter of the commando you want to run \n
    R)ead Todos   A)dd a Todo   D)elete a Todo   L)oad a .csv   S)ave a .csv
    """
    command = IO.gets(prompt)
      |> String.trim
      |> String.downcase

    case command do
      "r"        -> show_todos(data)
      "d"        -> delete_todos(data)
      "q"        -> "Goobye"
      _          -> get_command(data)
    end
  end

  def delete_todos() do
    todo = IO.gets("Which todo would you like to delete? \n") |> String.trim
    if Map.has_key? data, todo do
      IO.puts "ok."
      new_map = Map.drop(data, [todo])
      IO.puts ~s("#{todo}" has been deleted.)
      get_command(new_map)
    else
      IO.puts ~s(There is no Todo named "#{todo}"!)
      show_todos(data, false)
      delete_todos(data)
    end
  end

  def read(filename) do
    case File.read(filename) do 
      {:ok, body}      -> body
      {:error, reason} -> IO.puts ~s(Could'nt open file #{filename})
                          IO.puts ~s("#{:file.format_error reason}")
                          start()
    end
  end

  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header, ",")
    parse_lines(lines, titles)
  end

  def parse_lines(lines, titles) do
    Enum.reduc(lines, %{}, fn line, built ->
      [name | fields] = String.split(line, ",")
      if Enum.count(fields) == Enum.count(titles) do 
        line_data = Enum.zip(titles, fields) |> Enum.into(%{})
        Map.merge(built, %{name => line_data})
      else
        built
      end
    end)
  end

  def show_todos(data, next_command? \\ true) do
    itens = Map.keys data
    IO.puts "You have the following Todos: \n"
    Enum.each itens, fn item -> IO.puts item end
    IO.puts "\n"
    if next_command? do
      get_command(data)
    end
  end

  #20min - https://alchemist.camp/episodes/minimal-todo-1
end