defmodule ERP do
  require Record

  Enum.each(
    [
      :branch,
      :buyer,
      :contract,
      :crmRole,
      :access,
      :orgEmail,
      :fileDesc,
      :acc,
      :dict,
      :delivery,
      :employee,
      :inventory,
      :material,
      :location,
      :investment,
      :organization,
      :person,
      :payment,
      :seller,
      :buyer,
      :transport,
      :warehouse,
      :product,
      :tic
    ],
    fn t ->
      Enum.each(
        Record.extract_all(
          from_lib: "schema/include/dict/" <> :erlang.list_to_binary(:erlang.atom_to_list(t)) <> ".hrl"
        ),
        fn {name, definition} ->
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

  defmacro __using__(opts \\ []) do
    imports =
      opts
      |> Macro.expand(__CALLER__)
      |> Keyword.get(:with, [:erp])

    Enum.map(imports, fn mod ->
      if Code.ensure_compiled(mod) do
        upcased = Module.concat([String.upcase(to_string(mod))])

        quote do
          import unquote(upcased)
          alias unquote(mod), as: unquote(upcased)
        end
      else
        IO.warn("🚨 Unknown module #{mod} was requested to be used by :erp. Skipping.")
      end
    end)
  end
end
