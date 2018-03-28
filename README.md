Notifier
========

OSX notifications in a pluggable architecture for other kinds of notifications.

Borrows heavily from the fabulous [navinpeiris/ex_unit_notifier](https://github.com/navinpeiris/ex_unit_notifier)! Thanks, Navin. You're awesome.

![demo](https://cloud.githubusercontent.com/assets/1875157/18220797/a8d200b0-7143-11e6-81f6-f8b65bc7604a.gif)

# Requirements

For icon support, you must install [terminal-notifier](https://github.com/julienXX/terminal-notifier)

`> brew install terminal-notifier`

# Usage

Add it to your dependencies

```elixir
# mix.exs
def deps do
  [{:notifier, "~> 0.0.1"}]
end
```

```bash
> mix deps.get
```

```elixir
Notifier.notify("This is my message.")

Notifier.notify("MY TITLE", "This is my message.")

# All the options, local image
Notifier.notify(%{
  title: "MY TITLE", 
  message: "This is my message.",
  sound: "Basso",
  icon: "/Users/yourname/Pictures/cute_picture.png"
})

# All the options, remote image
Notifier.notify(%{
  title: "MY TITLE", 
  message: "This is my message.",
  sound: "Basso",
  icon: "http://www.gnu.org/graphics/heckert_gnu.small.png"
})

# Some options
Notifier.notify(%{
  sound: "Basso", 
  title: "MY TITLE", 
  message: "This is my message."
})

# Fewer options
Notifier.notify(%{title: "MY TITLE", message: "This is my message."})
Notifier.notify(%{title: "MY TITLE"})
Notifier.notify(%{message: "This is my message."})
```

## Selecting a Plugin

You may optionally specify which plugin Notifier uses.

```elixir
config.exs

config :notifier, :plugin, Notifier.TerminalNotifierPlugin
# config :notifier, :plugin, Notifier.ApplescriptPlugin
# config :notifier, :plugin, Notifier.PutsPlugin
```

## Adding your own Plugin

Let's say you want to use Growl or some other style of notification. No problem!
Implement the `Notifier.Plugin` behavior like so:

```elixir
defmodule Notifier.MyPlugin do
  @behaviour Notifier.Plugin

  def notify(%{title: title, message: message, sound: sound, icon: icon}) do
    # Whatever magic you do to notify the person at the screen.
  end

  def available? do
    # Return true if this plugin will work in this environment, false otherwise.
  end
end
```

Then set your config to use your notifier.

```elixir
config.exs

config :notifier, :plugin, MyNamespace.MyPlugin
```

If you do this, I'd love a pull request so I can add it to the package.

# Acknowledgements

Thanks to Navin Peiris (http://navinpeiris.com) for code. 
Thanks to Spreedly (http://spreedly.com) for being a terrific place to work. 

# License
```
MIT License

Copyright (c) 2016 Adrian P. Dunston I

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
