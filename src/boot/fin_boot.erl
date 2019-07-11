-module(fin_boot).
-compile(export_all).
-include("money.hrl").
-include("person.hrl").
-include("acc.hrl").
-include("product.hrl").
-include("payment.hrl").
-include("investment.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

boot() ->
   accounts().

acc("NYNJA") ->
   [ #'Acc'{id = "insurance", rate = {2,70}},
     #'Acc'{id = "options", rate = {2,10}},
     #'Acc'{id = "reserved", rate = {2,10}},
     #'Acc'{id = "R&D", rate = {2,10}}
   ];

acc("CATALX") ->
   [ #'Acc'{id = "insurance", rate = {2,50}},
     #'Acc'{id = "options", rate = {2,10}},
     #'Acc'{id = "reserved", rate = {2,15}},
     #'Acc'{id = "R&D", rate = {2,15}}
   ].

accounts() ->
   lists:map(fun(#'Product'{code=C} = P) ->
      lists:map(fun(#'Acc'{}=SubAcc) -> kvs:append(SubAcc,"/fin/"++C) end,acc(C))
      end, plm_boot:products()).
