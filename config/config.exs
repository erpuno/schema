import Config

config :bpe,
  ttl: :infinity,
  ping_discipline: :undefined,
  shutdown_timeout: 20000,
  timeout: 30000,
  procmodules: [
    :bpe_account,
  ],
  logger_level: :error,
  logger: [
    {:handler, :synrc, :logger_std_h,
     %{
       level: :debug,
       id: :synrc,
       max_size: 2000,
       module: :logger_std_h,
       config: %{type: :file, file: ~c"erp.log"},
       formatter:
         {:logger_formatter,
          %{
            template: [:time, ~c" ", :pid, ~c" ", :module, ~c" ", :msg, ~c"\n"],
            single_line: true
          }}
     }}
  ]

 if (System.get_env("KVS_BACKEND") || System.get_env("BPE_BACKEND") || "mnesia") == "rocksdb"
  do import_config "config.rocksdb.exs"
else import_config "config.mnesia.exs" end

config :erp,
  boot: []
