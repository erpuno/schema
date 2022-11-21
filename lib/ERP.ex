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
      case :kvs.all('/erp/') do
           [] -> :erp.boot()
            _ -> :skip
      end
      Supervisor.start_link([], strategy: :one_for_one, name: EXO.Supervisor)
  end

  @schema [  :branch,       :buyer,        :contract,    :crmRole,
             :access,       :orgEmail,     :fileDesc,    :acc,
             :dict,         :notification, :delivery,    :employee,
             :inventory,    :material,     :location,    :investment,
             :organization, :person,       :payment,     :seller,
             :buyer,        :transport,    :warehouse,   :product,
             :account,      :client,       :card,        :transaction,
             :currency,     :field       , :program,     :phone   ]

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

   def metainfo(), do: KVS.schema( name: :erp, tables: erp())

   def table(name) do
       erp_fields = :application.get_env(:schema, :erp_fields, [])
       {a,b} = :lists.unzip(:proplists.get_value(name, erp_fields, []))
       KVS.table(name: name, fields: a, instance: b)
   end

   def erp(), do: :lists.map(fn x -> table(x) end, @schema)

end
