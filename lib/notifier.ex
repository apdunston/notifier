defmodule Notifier do
  @plugin Application.get_env(:notifier, :plugin)

  def notify(map = %{sound: _sound, title: _title, message: _message}), do:
    plugin().notify(map)
  def notify(map = %{title: _title, message: _message}), do:
    plugin().notify(map)
  def notify(%{title: title}), do:
    plugin().notify(%{title: title, message: ""})
  def notify(%{message: message}), do:
    plugin().notify(%{title: "", message: message})  
  def notify(message), do: notify(%{message: message})
  def notify(title, message), do: notify(%{title: title, message: message})

  def plugin(), do: plugin(@plugin)
  def plugin(nil), do: Notifier.ApplescriptPlugin
  def plugin(actual_plugin), do: actual_plugin
end
