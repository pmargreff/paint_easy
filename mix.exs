defmodule PaintEasy.MixProject do
  use Mix.Project

  def project do
    [
      app: :paint_easy,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.10.2", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10.6"}
    ]
  end
end
