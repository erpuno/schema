-module(erp).
-include("dict/acc.hrl").
-include("dict/organization.hrl").
-include("dict/person.hrl").
-include("dict/employee.hrl").
-include("dict/buyer.hrl").
-include("dict/investment.hrl").
-include("dict/salary.hrl").
-include("dict/payment.hrl").
-include("dict/transport.hrl").
-include("dict/seller.hrl").
-include("dict/warehouse.hrl").
-include("dict/inventory.hrl").
-include("dict/material.hrl").
-include("dict/contract.hrl").
-include("dict/location.hrl").
-include("dict/product.hrl").
-include("dict/branch.hrl").
-include("dict/delivery.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("kvs/include/cursors.hrl").
-export([start/2, stop/1, init/1, x/0, metainfo/0, tables/0, boot/0]).

x() -> #'Organization'{}.

stop(_)      -> ok.
init([])     -> {ok, { {one_for_one, 5, 10}, []} }.
boot()       -> [ M:boot() || M <- application:get_env(schema,boot,[]) ].
start(_, _)  -> erlang:system_flag(time_offset, finalize),
                kvs:join(), erp:boot(),
                supervisor:start_link({local, ?MODULE}, ?MODULE, []).

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
