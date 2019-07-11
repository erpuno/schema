-module(erp_boot).
-compile(export_all).
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

boot() ->
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

