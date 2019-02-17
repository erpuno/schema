-module(erp).
-compile(export_all).
-behaviour(application).
-behaviour(supervisor).
-include_lib("kvs/include/metainfo.hrl").
-include("buyer.hrl").
-include("transport.hrl").
-include("seller.hrl").
-include("warehouse.hrl").
-include("inventory.hrl").
-include("person.hrl").
-include("material.hrl").
-include("contract.hrl").
-include("organization.hrl").
-include("location.hrl").
-include("branch.hrl").
-include("delivery.hrl").
-export([start/2, stop/1, init/1]).

start(_StartType, _StartArgs) -> supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_State) -> ok.
init([]) -> {ok, { {one_for_one, 5, 10}, []} }.

metainfo() -> #schema { name = kvs,    tables = tables() }.
tables() -> [ #table  { name = 'Buyer', fields = record_info(fields, 'Buyer') },
              #table  { name = 'Seller', fields = record_info(fields, 'Seller') },
              #table  { name = 'Material', fields = record_info(fields, 'Material') },
              #table  { name = 'Inventory', fields = record_info(fields, 'Inventory') },
              #table  { name = 'Transport', fields = record_info(fields, 'Transport') },
              #table  { name = 'Location', fields = record_info(fields, 'Location') },
              #table  { name = 'Delivery', fields = record_info(fields, 'Delivery') },
              #table  { name = 'Branch', fields = record_info(fields, 'Branch') },
              #table  { name = 'Contract', fields = record_info(fields, 'Contract') },
              #table  { name = 'Ogranization', fields = record_info(fields, 'Organization') },
              #table  { name = 'Person', fields = record_info(fields, 'Person') },
              #table  { name = 'Warehouse', fields = record_info(fields, 'Warehouse') }
            ].

