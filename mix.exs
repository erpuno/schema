defmodule ERP.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :erp,
      version: "7.4.13",
      description: "ERP/1 Directory Schema",
      erlc_options: [:nowarn_export_all, :nowarn_deprecated_function]
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc lib include src mix.exs LICENSE README.md),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :erp,
      links: %{"GitHub" => "https://github.com/erpuno/erp"}
    ]
  end

  def application() do
    [mod: {:schema, []}]
  end

  def deps() do
    deps = [
      {:bpe, "11.4.15"},
      {:form, "8.3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]

    backend = System.get_env("KVS_BACKEND") || "rocksdb"

    if backend == "rocksdb" do
      deps ++ [{:rocksdb, "~> 2.5.0"}]
    else
      deps
    end
  end
end
