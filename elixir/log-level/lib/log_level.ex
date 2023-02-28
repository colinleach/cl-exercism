defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level > 5 or level < 0 -> :unknown
      legacy? -> elem({:unknown, :debug, :info, :warning, :error, :unknown}, level)
      true -> elem({:trace, :debug, :info, :warning, :error, :fatal}, level)
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown -> if legacy?, do: :dev1, else: :dev2
      true -> false
    end
  end
end
