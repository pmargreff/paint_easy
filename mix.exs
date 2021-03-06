defmodule PXM.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :pxm,
      description: "A package to handle images from PPM format.",
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ],
      test_coverage: [tool: ExCoveralls],
      source_url: "https://github.com/pmargreff/pxm",
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10.6"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp docs() do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: [
        "README.md": [title: "README"]
      ]
    ]
  end

  defp package() do
    [
      maintainers: ["Pablo Margreff"],
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/pmargreff/PXM."}
    ]
  end
end
