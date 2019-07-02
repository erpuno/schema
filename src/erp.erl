-module(erp).
-compile(export_all).
-include("organization.hrl").
-include("person.hrl").
-include("employee.hrl").
-include("buyer.hrl").
-include("transport.hrl").
-include("seller.hrl").
-include("warehouse.hrl").
-include("inventory.hrl").
-include("material.hrl").
-include("contract.hrl").
-include("location.hrl").
-include("branch.hrl").
-include("delivery.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("kvs/include/cursors.hrl").
-export([start/2, stop/1, init/1]).

stop(_)      -> ok.
init([])     -> {ok, { {one_for_one, 5, 10}, []} }.
start(_, _)  -> X = supervisor:start_link({local, ?MODULE}, ?MODULE, []), kvs:join(), erp:boot(), X.
r()          -> application:stop(erp), application:start(erp), boot().

group()      -> kvs:feed("/erp/group").
partners()   -> kvs:feed("/erp/partners").
employees(C) -> kvs:feed("/erp/quanterall/" ++ C).

boot() ->
    Structure    = [ "/erp/group", "/erp/partners", "/erp/branches/quanterall" ],
    GroupOrgs    = [ #'Organization'{name="Quanterall", url="quanterall.com"} ],
    HeadBranches = [ #'Branch'{ loc = #'Location'{ city = "Varna",   country = "BG" } },
                     #'Branch'{ loc = #'Location'{ city = "Sophia",  country = "BG" } },
                     #'Branch'{ loc = #'Location'{ city = "Plovdiv", country = "BG" } } ],
    PartnersOrgs = [ #'Organization'{name="NYNJA, Inc.",    url= "nynja.io"},
                     #'Organization'{name="CATALX",         url=[]},
                     #'Organization'{name="FiaTech",        url=[]},
                     #'Organization'{name="3Stars",         url=[]},
                     #'Organization'{name="SwissEMX",       url=[]},
                     #'Organization'{name="HistoricalPark", url=[]},
                     #'Organization'{name="Intralinks",     url=[]} ],
    case {kvs:get(writer,"/erp/group"),kvs:get(writer,"/erp/partners")} of
         {{error,_},{error,_}} ->
              lists:map(fun(X) -> kvs:writer(X) end, Structure),
              lists:map(fun(X) -> kvs:append(X,"/erp/group") end, GroupOrgs),
              lists:map(fun(X) -> kvs:append(X,"/erp/partners") end, PartnersOrgs),
              lists:map(fun(#'Branch'{ loc = #'Location'{ city = City }} = B) ->
                                  kvs:append(B,"/erp/branches/quanterall"),
                                  Function = list_to_atom(City),
                                  [ begin
                                      kvs:append(X,"/erp/quanterall/" ++ City),
                                      kvs:put(#'PersonCN'{id=X#'Employee'.id,
                                                          cn=(X#'Employee'.person)#'Person'.cn})
                                  end || X <- erp_employees:Function(City) ] end,
                                  HeadBranches),
              lists:map(fun(X) -> {X,kvs:feed(X)} end, Structure);
                             _ -> skip end.

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
              #table  { name = 'Employee',     fields = record_info(fields, 'Employee') },
              #table  { name = 'Warehouse',    fields = record_info(fields, 'Warehouse') }
            ].
