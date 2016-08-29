defmodule Notifier.Plugin do
  @callback notify(String.t, String.t) :: any
  @callback notify(Atom.t, String.t, String.t, String.t) :: any
end