defmodule PersianCalendar.Mixfile do
  use Mix.Project

  def project do
    [app: :persian_calendar,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end


  def description do
    """
    Provides Persian calendar for converting gregorian (milady) date to shamsi date and reverse
    """
  end

  def package do
    [
      name: :persian_calendar,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Salman Arab Ameri"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/SalmanAA/PersianCalendar"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end
end
