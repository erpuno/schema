defmodule ERP.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :schema,
      version: "4.1.2",
      description: "ERP.UNO State Enterprise Directory Schema",
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc lib include src mix.exs LICENSE),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :schema,
      links: %{"GitHub" => "https://github.com/erpuno/schema"}
    ]
  end

  def application() do
    [mod: {:schema, []}]
  end

  def deps() do
    [
      {:dec, "~> 0.10.2"},
      {:bpe, "9.9.7"},
      {:form, "8.3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
