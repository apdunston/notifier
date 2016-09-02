defmodule Notifier.TerminalNotifierPlugin do
  @moduledoc """
  Displays a notification via terminal-notifier.
  https://github.com/julienXX/terminal-notifier
  """
  @behaviour Notifier.Plugin

  def notify(map = %{title: _, message: _, sound: _, icon: _}) do
    System.cmd(executable, options(map))
    :ok
  end

  def available?, do: executable != nil

  defp executable, do: System.find_executable "terminal-notifier"

  defp options(map = %{title: _, message: _, sound: "", icon: _}),
    do: base_options(map)
  defp options(map = %{title: _, message: _, sound: sound, icon: _}),
    do: base_options(map) ++ ["-sound", sound]

  defp base_options(%{title: title, message: message, icon: icon}) do
    ["-group", "elixir-based-notifier",
      "-title", title,
      "-message", message,
      "-appIcon", icon]
  end

end
