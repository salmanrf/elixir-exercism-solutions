defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  defp loop(last_state \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, last_state)
        loop(last_state)
      {:take_a_number, sender_pid} ->
        new_state = last_state + 1
        send(sender_pid, new_state)
        loop(new_state)
      :stop -> nil
      _ -> loop(last_state)
    end
  end
end
