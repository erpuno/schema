-module(erp_boot).
-compile(export_all).
-include("organization.hrl").
-include("location.hrl").
-include("person.hrl").
-include("product.hrl").
-include("branch.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("kvs/include/cursors.hrl").

boot() ->
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

    Structure    = [ {"/erp/group", GroupOrgs},
                     {"/erp/partners", PartnersOrgs},
                     {"/erp/quanterall", HeadBranches}],

    lists:foreach(fun({Feed, Data}) ->
                         case kvs:get(writer, Feed) of
                              {error,_} -> lists:map(fun(X) -> kvs:append(X,Feed) end, Data);
                                      _ -> skip
                         end
                  end, Structure).

