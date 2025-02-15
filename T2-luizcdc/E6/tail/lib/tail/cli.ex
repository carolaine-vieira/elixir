defmodule Tail.CLI do
  def main(args) do
    {parsed, args, invalid} =
      OptionParser.parse(
        args,
        switches: [lines: :integer],
        aliases: [n: :lines]
      )

    Tail.start(parsed, args, invalid)
  end
end
