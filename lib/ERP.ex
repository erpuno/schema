defmodule ERP do
  require Record

  files = Path.wildcard("include/erp/**/*")

  hrl_files =
    Enum.filter(files, fn f ->
      Path.extname(f) == ".hrl"
    end)
  Enum.each(
    hrl_files,
    fn t ->
      Enum.each(
        Record.extract_all([from_lib: "schema/" <> t, includes: ["include"]]),
        fn {name, definition} ->
          # :io.format '~p', [{name}]
          prev = :application.get_env(:kernel, :erp_tables, [])

          case :lists.member(name, prev) do
            true ->
              :skip

            false ->
              Record.defrecord(name, definition)
              :application.set_env(:kernel, :erp_tables, [name | prev])
          end
        end
      )
    end
  )
end
