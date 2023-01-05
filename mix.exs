defmodule AssignmentFirst.MixProject do
  use Mix.Project

  def project do
    [
      app: :assignment_first,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
    ]
  end
  defp aliases do
    [
     test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:plug,
      :logger],
      mod: {AssignmentFirst.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.

  def deps do
    [
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
    ]
  end
end
