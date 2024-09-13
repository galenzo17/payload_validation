defmodule ValidadorJson.MixProject do
  use Mix.Project

  def project do
    [
      app: :validador_json,
      version: "0.1.0",
      elixir: "~> 1.15",  # Asegúrate de que esta versión coincide con la que tienes instalada
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: ValidadorJson]  # Añade esta línea dentro de la función project
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.2"},
      {:ex_json_schema, "~> 0.9.1"}
    ]
  end
end
