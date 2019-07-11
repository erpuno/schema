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

payments(C) -> kvs:all("/plm/"++C++"/income").

mul({A,B},{C,D}) -> {A+C,B*D}.

rate(#'Payment'{price=P, volume=V}=Pay,#'Acc'{id=Id, rate=R}=Acc,C) ->
  Pay#'Payment'{invoice= kvs:seq([],[]), volume={0,1}, price=mul(R,mul(P,V))}.

accounts() ->
  lists:map(fun(#'Product'{code=C}) ->
    lists:map(fun(#'Acc'{id=Id, rate=R}=SubAcc) ->
      Address = lists:concat(["/fin/acc/",C]),
      kvs:append(SubAcc,Address),
      Feed = lists:concat(["/fin/tx/",C,"/",Id]),
      case kvs:get(writer, Feed) of
           {error,_} -> lists:map(fun(#'Payment'{invoice=I,price=P, volume=V}=Pay) ->
                        kvs:append(rate(Pay,SubAcc,C), Feed) end, payments(C));
             {ok,_} -> skip
      end
    end, acc(C))
  end, plm_boot:products()).
