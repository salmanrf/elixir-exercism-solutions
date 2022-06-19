defmodule Username do
  def sanitize('') do
    ''
  end

  def sanitize(username) do
    [head | tail] = ~c(username)

    case head do
      228 -> 'ae' ++ sanitize(tail)
      246 -> 'oe' ++ sanitize(tail)
      252 -> 'ue' ++ sanitize(tail)
      223 -> 'ss' ++ sanitize(tail)
      _ when head == 95 -> [ head | sanitize(tail)]
      _ when head > 96 and head < 123 -> [ head | sanitize(tail)]
      _ -> sanitize(tail)
    end
  end
end
