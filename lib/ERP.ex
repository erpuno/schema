defmodule ERP do
  use Application
  use Supervisor
  require KVS
  require Record

  def stop(_), do: :ok
  def init([]), do: {:ok, { {:one_for_one, 5, 10}, []} }

  def start(_, _) do
      :erlang.system_flag(:time_offset, :finalize)
      :kvs.join
      Supervisor.start_link([], strategy: :one_for_one, name: EXO.Supervisor)
  end

  @schema [
      :branch,
      :buyer,
      :contract,
      :acc,
      :delivery,
      :employee,
      :inventory,
      :material,
      :location,
      :investment,
      :organization,
      :person,
      :payment,
      :project,
      :sendInfo,
      :seller,
      :buyer,
      :transport,
      :warehouse,
      :product,
      :tic
    ]


  Enum.each(
    @schema,
    fn t ->
      Enum.each(
        Record.extract_all(
          from_lib: "schema/include/dict/" <> :erlang.list_to_binary(:erlang.atom_to_list(t)) <> ".hrl"
        ),
        fn {name, definition} ->
          prev = :application.get_env(:schema, :erp_tables, [])
          prev2 = :application.get_env(:schema, :erp_fields, [])
          case :lists.member(name, prev) do
            true ->
              :skip

            false ->
              Record.defrecord(name, definition)
              :application.set_env(:schema, :erp_tables, [name | prev])
              :application.set_env(:schema, :erp_fields, [{name,definition} | prev2])
          end
        end
      )
    end
  )

  Enum.each(
    [
      :sevDoc,
      :internalDoc,
      :inputOrder,
      :outputOrder,
      :orgDoc
    ],
    fn t ->
      Enum.each(
        Record.extract_all(
          from_lib: "schema/include/docs/" <> :erlang.list_to_binary(:erlang.atom_to_list(t)) <> ".hrl"
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



  def metainfo(), do: KVS.schema( name: :erp, tables: erp())

  def table(name) do
      erp_fields = :application.get_env(:schema, :erp_fields, [])
      {a,b} = :lists.unzip(:proplists.get_value(name, erp_fields, []))
      KVS.table(name: name, fields: a, instance: b)
  end

  def erp(), do: :lists.map(fn x -> table(x) end, @schema)

end
