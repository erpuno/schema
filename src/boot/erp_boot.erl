-module(erp_boot).
-export([boot/0]).
-include("dict/organization.hrl").
-include("dict/location.hrl").
-include("dict/person.hrl").
-include("dict/product.hrl").
-include("dict/branch.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("kvs/include/cursors.hrl").

boot() ->
    GroupOrgs    = [ #'Organization'{id = "Quanterall", name="Quanterall", url="quanterall.com"} ],

    HeadBranches = [ #'Branch'{ loc = #'Loc'{ city = "Varna",   country = "BG" } },
                     #'Branch'{ loc = #'Loc'{ city = "Sophia",  country = "BG" } },
                     #'Branch'{ loc = #'Loc'{ city = "Plovdiv", country = "BG" } } ],

    PartnersOrgs = [ #'Organization'{id = "NYNJA, Inc.", name="NYNJA, Inc.",          url="nynja.io"},
                     #'Organization'{id = "Catalx Exchange Inc.", name="Catalx Exchange Inc.", url="catalx.io"},
                     #'Organization'{id = "FinaTech", name="FinaTech",             url="finatech.se"},
                     #'Organization'{id = "3Stars", name="3Stars",         url=[]},
                     #'Organization'{id = "SwissEMX", name="SwissEMX",       url=[]},
                     #'Organization'{id = "HistoricalPark", name="HistoricalPark", url=[]},
                     #'Organization'{id = "Intralinks", name="Intralinks",     url=[]} ],

    Structure    = [ {"/erp/group", GroupOrgs},
                     {"/erp/partners", PartnersOrgs},
                     {"/erp/quanterall", HeadBranches}],

    lists:foreach(fun({Feed, Data}) ->
        case kvs:get(writer, Feed) of
             {ok,_} -> skip;
          {error,_} -> lists:map(fun(X) ->
                       kvs:append(X,Feed) end, Data) end
                  end, Structure).
