-module(erp).
-compile(export_all).
-include("organization.hrl").
-include("person.hrl").
-include("employee.hrl").
-include("buyer.hrl").
-include("investment.hrl").
-include("salary.hrl").
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
start(_, _)  -> X = supervisor:start_link({local, ?MODULE}, ?MODULE, []),
                kvs:join(), erp_boot(), acc_boot(), plm_boot(), pay_boot(), sal_boot(),
                inv_boot(), X.

group()      -> kvs:feed("/erp/group").
partners()   -> kvs:feed("/erp/partners").
employees(C) -> kvs:feed("/acc/quanterall/" ++ C).

plm_boot() -> erp_products:plm_boot().
pay_boot() -> erp_products:pay_boot().
sal_boot() -> erp_products:sal_boot().
inv_boot() -> erp_products:inv_boot().
acc_boot() ->
    case kvs:get(writer,"/acc/quanterall/Varna") of
        {error,_} ->
    lists:map(fun(#'Branch'{ loc = #'Loc'{ city = City }} = B) ->
        Function = list_to_atom(City),
       [ begin
           kvs:append(X,"/acc/quanterall/" ++ City),
           kvs:put(#'PersonCN'{id=X#'Employee'.id,
                               cn=(X#'Employee'.person)#'Person'.cn})
         end || X <- erp_employees:Function(City) ] end, kvs:feed("/erp/quanterall")); {ok,_} -> skip end.

erp_boot() ->
    Structure    = [ "/erp/group", "/erp/partners", "/erp/quanterall" ],
    GroupOrgs    = [ #'Organization'{name="Quanterall", url="quanterall.com"} ],
    HeadBranches = [ #'Branch'{ loc = #'Loc'{ city = "Varna",   country = "BG" } },
                     #'Branch'{ loc = #'Loc'{ city = "Sophia",  country = "BG" } },
                     #'Branch'{ loc = #'Loc'{ city = "Plovdiv", country = "BG" } } ],
    PartnersOrgs = [ #'Organization'{name="NYNJA, Inc.",    url= "nynja.io"},
                     #'Organization'{name="Catalx Exchange Inc.", url="catalx.io"},
                     #'Organization'{name="FiaTech",        url=[]},
                     #'Organization'{name="3Stars",         url=[]},
                     #'Organization'{name="SwissEMX",       url=[]},
                     #'Organization'{name="HistoricalPark", url=[]},
                     #'Organization'{name="Intralinks",     url=[]} ],
    case {kvs:get(writer,"/erp/group"),kvs:get(writer,"/erp/partners")} of
         {{error,_},{error,_}} ->
              lists:map(fun(X) -> kvs:writer(X) end, Structure),
              lists:map(fun(X) -> kvs:append(X,"/erp/quanterall") end, HeadBranches),
              lists:map(fun(X) -> kvs:append(X,"/erp/group") end, GroupOrgs),
              lists:map(fun(X) -> kvs:append(X,"/erp/partners") end, PartnersOrgs);
                             _ -> skip end.

metainfo() -> #schema { name = kvs,  tables = tables() }.
tables() -> [ #table  { name = 'Buyer',        fields = record_info(fields, 'Buyer') },
              #table  { name = 'Seller',       fields = record_info(fields, 'Seller') },
              #table  { name = 'Material',     fields = record_info(fields, 'Material') },
              #table  { name = 'Inventory',    fields = record_info(fields, 'Inventory') },
              #table  { name = 'Transport',    fields = record_info(fields, 'Transport') },
              #table  { name = 'Loc',          fields = record_info(fields, 'Loc') },
              #table  { name = 'Delivery',     fields = record_info(fields, 'Delivery') },
              #table  { name = 'Investment',   fields = record_info(fields, 'Investment') },
              #table  { name = 'Salary',       fields = record_info(fields, 'Salary') },
              #table  { name = 'Branch',       fields = record_info(fields, 'Branch') },
              #table  { name = 'Product',      fields = record_info(fields, 'Product') },
              #table  { name = 'Contract',     fields = record_info(fields, 'Contract') },
              #table  { name = 'Organization', fields = record_info(fields, 'Organization') },
              #table  { name = 'Person',       fields = record_info(fields, 'Person') },
              #table  { name = 'Employee',     fields = record_info(fields, 'Employee') },
              #table  { name = 'Warehouse',    fields = record_info(fields, 'Warehouse') }
            ].
