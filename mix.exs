defmodule Notifier.Mixfile do
  use Mix.Project

  def project do
    [app: :notifier,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package(),
     description: description()]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:dogma, "~> 0.1", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 0.9.0-rc1", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    OSX notifications in a pluggable architecture for other kinds of notifications.
    """
  end

  defp package do
    [
      name: :notifier,
      maintainers: ["Adrian Dunston"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/apdunston/notifier"}]
  end

end
