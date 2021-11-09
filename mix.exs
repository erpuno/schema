defmodule ERP.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :schema,
      version: "2.11.0",
      elixir: "~> 1.7",
      description: "ERP Directory Schema",
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc lib include src mix.exs LICENSE),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :erp,
      links: %{"GitHub" => "https://github.com/erpuno/schema"}
    ]
  end

  def application() do
    [mod: {:erp, []}]
  end

  def deps() do
    [
      {:dec, "~> 0.10.2"},
      {:kvs, "~> 8.10.4"},
      {:rocksdb, "~> 1.6.0"},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end
end
