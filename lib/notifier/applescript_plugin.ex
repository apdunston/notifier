defmodule Notifier.ApplescriptPlugin do
  @moduledoc """
  Displays a notification via command-line Applescript. Ignores icon
  """
  @behaviour Notifier.Plugin

  def notify(%{title: title, message: message, sound: sound, icon: _icon}) do
    {title, message}
    |> make_applescript
    |> add_sound(sound)
    |> run_applescript
    :ok
  end

  def available?, do: executable() != nil
  defp executable, do: System.find_executable "osascript"


  defp make_applescript({title, message}),
    do: "display notification \"#{message}\" with title \"#{title}\""

  defp add_sound(applescript, ""), do: applescript
  defp add_sound(applescript, sound_name),
    do: applescript <> " sound name \"#{sound_name}\""

  defp run_applescript(applescript), do:
    System.cmd("osascript", ["-e", applescript])
end
