defmodule Notifier.PutsPlugin do
  @moduledoc """
  Displays a notification via IO.puts
  """
  @behaviour Notifier.Plugin

  def notify(%{title: title, message: message, sound: _sound, icon: _icon}) do
    IO.puts "\n"
    puts_title title
    puts_message message
    IO.puts "\n"
    :ok
  end

  def puts_title("") do end
  def puts_title(title), do: IO.puts "*** #{title} ***"

  def puts_message("") do end
  def puts_message(message), do: IO.puts message

  def available?, do: true
end
