defmodule ABAC do
  require Record

  Enum.each(
    Enum.filter(Path.wildcard("include/abac/*"), &(Path.extname(&1) == ".hrl")),
    fn t ->
      Enum.each(
        Record.extract_all([from_lib: "schema/" <> t, includes: ["include"]]),
        fn {name, definition} ->
          case :lists.member(name, :application.get_env(:kernel, :erp_tables, [])) do
            true -> :skip
            false ->
              Record.defrecord(name, definition)
              :application.set_env(:kernel, :erp_tables, [name | :application.get_env(:kernel, :erp_tables, [])])
          end
        end
      )
    end
  )

end