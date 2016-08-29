defmodule Notifier.Plugin do
  @callback notify(%{title: String.t, message: String.t}) :: any
  @callback notify(%{title: String.t, message: String.t, sound: String.t}) :: any
end