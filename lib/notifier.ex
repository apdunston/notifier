defmodule Notifier do
  @plugin Application.get_env(:notifier, :plugin)

  def notify(%{sound: sound, title: title, message: message}) do
    plugin().notify(:sound, title, message, sound)
  end

  def notify(%{title: title, message: message}) do
    plugin().notify(title, message)  
  end

  def plugin(), do: plugin(@plugin)
  def plugin(nil), do: Notifier.ApplescriptPlugin
  def plugin(actual_plugin), do: actual_plugin
end
