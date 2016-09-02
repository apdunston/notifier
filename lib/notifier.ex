defmodule Notifier do
  @moduledoc """
    Determines the appropriate plugin based on :notifier -> :plugin environment
    setting or the first available in a list.

    Passes along notify calls to that plugin for a variety of argument lists.
    Sound can be a path to a sound file or one of the standard sound files
    depending on your system and plugin.

    Icon can be a path to an image file or a URL depending on your plugin.
  """
  @plugin Application.get_env(:notifier, :plugin)

  @plugins [
    Notifier.TerminalNotifierPlugin,
    Notifier.ApplescriptPlugin,
    Notifier.PutsPlugin
  ]

  def notify(map = %{sound: _, title: _, message: _, icon: _}),
    do: plugin.notify(map)
  def notify(map = %{}), do: default_args |> Map.merge(map) |> (plugin.notify)
  def notify(message), do: notify(%{message: message})
  def notify(title, message), do: notify(%{title: title, message: message})

  defp default_args, do: %{title: "", sound: "", message: "", icon: ""}

  defp plugin,
    do: Application.get_env(:notifier, :plugin, first_available_plugin)

  defp first_available_plugin,
    do: @plugins |> Enum.find(fn plugin -> plugin.available? end)
end
