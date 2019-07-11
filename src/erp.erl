-module(erp).
-compile(export_all).
-include("acc.hrl").
-include("organization.hrl").
-include("person.hrl").
-include("employee.hrl").
-include("buyer.hrl").
-include("investment.hrl").
-include("salary.hrl").
-include("payment.hrl").
-include("transport.hrl").
-include("seller.hrl").
-include("warehouse.hrl").
-include("inventory.hrl").
-include("material.hrl").
-include("contract.hrl").
-include("location.hrl").
-include("product.hrl").
-include("branch.hrl").
-include("delivery.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("kvs/include/cursors.hrl").
-export([start/2, stop/1, init/1]).

stop(_)      -> ok.
init([])     -> {ok, { {one_for_one, 5, 10}, []} }.
boot()       -> [ M:boot() || M <- application:get_env(erp,boot,[]) ].
start(_, _)  -> kvs:join(), erp:boot(),
                supervisor:start_link({local, ?MODULE}, ?MODULE, []).

group()      -> kvs:feed("/erp/group").
partners()   -> kvs:feed("/erp/partners").
employees(C) -> kvs:feed("/acc/quanterall/" ++ C).

metainfo() -> #schema { name = kvs,  tables = tables() }.
tables() -> [ #table  { name = 'Buyer',        fields = record_info(fields, 'Buyer') },
              #table  { name = 'Seller',       fields = record_info(fields, 'Seller') },
              #table  { name = 'Material',     fields = record_info(fields, 'Material') },
              #table  { name = 'Inventory',    fields = record_info(fields, 'Inventory') },
              #table  { name = 'Transport',    fields = record_info(fields, 'Transport') },
              #table  { name = 'Loc',          fields = record_info(fields, 'Loc') },
              #table  { name = 'Acc',          fields = record_info(fields, 'Acc') },
              #table  { name = 'Delivery',     fields = record_info(fields, 'Delivery') },
              #table  { name = 'Investment',   fields = record_info(fields, 'Investment') },
              #table  { name = 'Salary',       fields = record_info(fields, 'Salary') },
              #table  { name = 'Payment',      fields = record_info(fields, 'Payment') },
              #table  { name = 'Branch',       fields = record_info(fields, 'Branch') },
              #table  { name = 'Product',      fields = record_info(fields, 'Product') },
              #table  { name = 'Contract',     fields = record_info(fields, 'Contract') },
              #table  { name = 'Organization', fields = record_info(fields, 'Organization') },
              #table  { name = 'Person',       fields = record_info(fields, 'Person') },
              #table  { name = 'Employee',     fields = record_info(fields, 'Employee') },
              #table  { name = 'Warehouse',    fields = record_info(fields, 'Warehouse') }
            ].
