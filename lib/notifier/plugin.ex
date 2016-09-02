defmodule Notifier.Plugin do
  @moduledoc "Defines behavior for Notifier plugins"

  @callback notify(%{
      title: String.t,
      message: String.t,
      sound: String.t,
      icon: String.t
  }) :: any

  @callback available?() :: any
end
