defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts "Welcome! Let's fill out your character sheet together."
  end

  def ask_name() do
    resp = IO.gets "What is your character's name?\n"
    String.trim(resp)
  end

  def ask_class() do
    resp = IO.gets "What is your character's class?\n"
    String.trim(resp)
  end

  def ask_level() do
    resp = IO.gets "What is your character's level?\n"
    resp |> String.trim() |> String.to_integer()
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    %{class: class, level: level, name: name}
    |> IO.inspect(label: "Your character")
  end
end
