defmodule ERP.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :erp,
      version: "7.4.14",
      description: "ERP/1 Directory Schema",
      package: package(),
      deps: deps(),
      erlc_options: [:nowarn_export_all, :nowarn_deprecated_function]
    ]
  end

  def package do
    [
      files: ~w(config lib include src mix.exs LICENSE README.md),
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

    if System.get_env("KVS_BACKEND") == "rocksdb" do
      deps ++ [{:rocksdb, "~> 2.5", optional: true}]
    else
      deps
    end
  end
end
