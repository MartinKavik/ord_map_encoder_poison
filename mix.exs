defmodule OrdMapEncoderPoison.MixProject do
  use Mix.Project

  def project do
    [
      app: :ord_map_encoder_poison,
      version: "0.1.0",
      elixir: "~> 1.6-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "OrdMap encoder",
      source_url: "https://github.com/MartinKavik/ord_map_encoder_poison",
      docs: [
        # The main page in the docs
        main: "ord_map_encoder_poison",
        extra_section: "GUIDES",
        extras: [
          "README.md": [filename: "ord_map_encoder_poison", title: "OrdMap Poison encoder"]
        ]
      ],

      # Package
      # build: mix compile && mix hex.audit && mix hex.build
      description: "Poison encoder for OrdMap",
      package: [
        maintainers: ["Martin Kavik"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/MartinKavik/ord_map_encoder_poison"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ord_map, "~> 0.1.0"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end
end
