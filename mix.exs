defmodule ERP.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :schema,
      version: "4.1.1",
      elixir: "~> 1.7",
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
      {:kvs, "~> 9.4.8"},
      {:bpe, "7.10.4"},
      {:form, "7.8.0"},
      {:rocksdb, "~> 1.6.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
