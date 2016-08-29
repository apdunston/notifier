Notifier
========

OSX notifications in a pluggable architecture for other kinds of notifications.

```elixir
Notifier.notify(%{sound: "Basso", title: "MY TITLE", message: "This is my message."})
Notifier.notify(%{title: "MY TITLE", message: "This is my message."})
Notifier.notify(%{title: "MY TITLE"})
Notifier.notify(%{message: "This is my message."})
Notifier.notify("This is my message.")
Notifier.notify("MY TITLE", "This is my message.")
```