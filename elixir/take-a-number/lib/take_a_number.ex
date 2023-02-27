defmodule TakeANumber do
  defp loop(num) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, num)
        loop(num)

      {:take_a_number, sender_pid} ->
        num = num + 1
        send(sender_pid, num)
        loop(num)

      :stop -> exit(:shutdown)

      _ -> loop(num)
    end
  end

  def start() do
    spawn(fn -> loop(0) end)
  end
end
