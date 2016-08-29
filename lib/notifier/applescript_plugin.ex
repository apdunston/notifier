defmodule Notifier.ApplescriptPlugin do
  @moduledoc """
  Displays a notification via command-line Applescript.
  """
  @behaviour Notifier.Plugin

  def notify(%{sound: sound, title: title, message: message}), do:
    {title, message} |> make_applescript |> add_sound(sound) |> run_applescript
  def notify(%{title: title, message: message}), do:
    {title, message} |> make_applescript |> run_applescript

  defp make_applescript({title, message}),
    do: "display notification \"#{message}\" with title \"#{title}\""

  defp add_sound(applescript, sound_name),
    do: applescript <> " sound name \"#{sound_name}\""

  defp run_applescript(applescript), do:
    System.cmd("osascript", ["-e", applescript])
end
