-module(erp).
-compile(export_all).
-behaviour(application).
-behaviour(supervisor).
-include_lib("kvx/include/metainfo.hrl").
-include_lib("kvx/include/kvx.hrl").
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

init([]) -> {ok, { {one_for_one, 5, 10}, []} }.
start(_, _) -> supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_) -> ok.

metainfo() -> #schema { name = kvs,  tables = tables() }.
tables() -> [ #table  { name = 'Buyer',        fields = record_info(fields, 'Buyer') },
              #table  { name = 'Seller',       fields = record_info(fields, 'Seller') },
              #table  { name = 'Material',     fields = record_info(fields, 'Material') },
              #table  { name = 'Inventory',    fields = record_info(fields, 'Inventory') },
              #table  { name = 'Transport',    fields = record_info(fields, 'Transport') },
              #table  { name = 'Location',     fields = record_info(fields, 'Location') },
              #table  { name = 'Delivery',     fields = record_info(fields, 'Delivery') },
              #table  { name = 'Branch',       fields = record_info(fields, 'Branch') },
              #table  { name = 'Contract',     fields = record_info(fields, 'Contract') },
              #table  { name = 'Organization', fields = record_info(fields, 'Organization') },
              #table  { name = 'Person',       fields = record_info(fields, 'Person') },
              #table  { name = 'Warehouse',    fields = record_info(fields, 'Warehouse') }
            ].

contra_agents() -> contra_agents.
owner_group()   -> owner_group.
group()         -> #reader{args=R}=kvx:take((kvx:bot(kvx:load_reader(1)))#reader{args=-1,dir=0}),
                   lists:map(fun(#'Organization'{name=X,url=Y}) -> {X,Y} end,R).
parties()       -> #reader{args=R}=kvx:take((kvx:bot(kvx:load_reader(2)))#reader{args=-1,dir=0}),
                   lists:map(fun(#'Organization'{name=X,url=Y}) -> {X,Y} end,R).

boot() ->
    kvx:join(),
    Self = owner_group(),
    Party = contra_agents(),
    case {kvx:get(writer,Self),kvx:get(writer,Self)} of
         {{error,_},{error,_}} ->

              Group = [ #'Organization'{name="Synrc",        url="github.com/synrc"},
                        #'Organization'{name="Enterprizing", url="github.com/enterprizing"},
                        #'Organization'{name="Groupoid",     url="github.com/groupoid"},
                        #'Organization'{name="O1",           url="github.com/o1"},
                        #'Organization'{name="O3",           url="github.com/o3"},
                        #'Organization'{name="O7",           url="github.com/o7"} ],

            Parties = [ #'Organization'{name="Privat48",     url="github.com/privat48"},
                        #'Organization'{name="NYNJA Group" , url="github.com/nynja-mc"},
                        #'Organization'{name="ERP+SCM",      url="github.com/supply"} ],

              [ kvx:save(kvx:writer(X)) || X <- [Self,Party] ],
              [ kvx:save(kvx:reader(X)) || X <- [Self,Party] ],
              [ kvx:save(kvx:add((kvx:load_writer(Self))#writer{args=Y}))   || Y <- Group ],
              [ kvx:save(kvx:add((kvx:load_writer(Party))#writer{args=Y})) || Y <- Parties ],
              [{group,length(Group)},{parties,length(Parties)}];
                          _ -> skip end.

