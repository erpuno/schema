use Mix.Config

config :kvs,
  dba: :kvs_rocks,
  dba_st: :kvs_st,
  schema: [:kvs, :kvs_stream, :erp]

config :schema,
  boot: [:erp_boot, :acc_boot, :pay_boot, :plm_boot, :fin_boot, :pay_boot]
