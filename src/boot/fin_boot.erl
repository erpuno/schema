-module(fin_boot).
-export([boot/0]).
-include("dict/person.hrl").
-include("dict/acc.hrl").
-include("dict/product.hrl").
-include("dict/payment.hrl").
-include("dict/investment.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

boot() ->
   accounts(),
%   inv_boot(),
   ok.

acc("NYNJA" = X) ->
   [ #'Acc'{id = X ++ "/insurance", rate = {money,2,70}},
     #'Acc'{id = X ++ "/options", rate = {money,2,10}},
     #'Acc'{id = X ++ "/reserved", rate = {money,2,10}},
     #'Acc'{id = X ++ "/R&D", rate = {money,2,10}}
   ];

acc("CATALX" = X ) ->
   [ #'Acc'{id = X ++ "/insurance", rate = {money,2,50}},
     #'Acc'{id = X ++ "/options", rate = {money,2,10}},
     #'Acc'{id = X ++ "/reserved", rate = {money,2,15}},
     #'Acc'{id = X ++ "/R&D", rate = {money,2,15}}
   ];

acc("FinaTech-Evoli" = X ) ->
   [ #'Acc'{id = X ++ "/insurance", rate = {money,2,50}},
     #'Acc'{id = X ++ "/options", rate = {money,2,10}},
     #'Acc'{id = X ++ "/reserved", rate = {money,2,15}},
     #'Acc'{id = X ++ "/R&D", rate = {money,2,15}}
   ];

acc("FinaTech-Stamps" = X ) ->
   [ #'Acc'{id = X ++ "/insurance", rate = {money,2,50}},
     #'Acc'{id = X ++ "/options", rate = {money,2,10}},
     #'Acc'{id = X ++ "/reserved", rate = {money,2,15}},
     #'Acc'{id = X ++ "/R&D", rate = {money,2,15}}
   ];

acc("FinaTech-Bynk" = X ) ->
   [ #'Acc'{id = X ++ "/insurance", rate = {money,2,50}},
     #'Acc'{id = X ++ "/options", rate = {money,2,10}},
     #'Acc'{id = X ++ "/reserved", rate = {money,2,15}},
     #'Acc'{id = X ++ "/R&D", rate = {money,2,15}}
   ];

% for future FIN releases and multibank accounts

acc(X) ->
   [
     #'Acc'{id = X ++ "/local", rate = {money,0,0}},
     #'Acc'{id = X ++ "/bpe", rate = {money,0,0}}
   ].

profit(C) ->
  lists:map(fun({#'Payment'{volume=Vo1,price=Pr1} = P1,
                 #'Payment'{volume=Vo2,price=Pr2} = _P2}) ->
               P1#'Payment'{volume={money,0,1},price=dec:sub(dec:mul(Vo1,Pr1),dec:mul(Vo2,Pr2))}
        end, lists:zip(kvs:all("/plm/"++C++"/income"),
                       kvs:all("/plm/"++C++"/outcome"))).

rate(#'Payment'{price=P, volume=V}=Pay,#'Acc'{id=_Id, rate=R}=_Acc,_C) ->
  Pay#'Payment'{invoice= kvs:seq([],[]), volume={money,0,1}, price=dec:mul(R,dec:mul(P,V))}.

accounts() ->
  lists:map(fun(#'Product'{id=C,code=Code}) ->
    lists:map(fun(#'Acc'{id=Id}=SubAcc) ->
      Address = lists:concat(["/fin/acc/",Code]),
      kvs:append(SubAcc,Address),
      Feed = lists:concat(["/fin/tx/",Id]),
      case kvs:get(writer, Feed) of
           {error,_} -> lists:map(fun(#'Payment'{}=Pay) ->
                        Payment = rate(Pay,SubAcc,C),
                        [Account,SubAccount] = string:tokens(Id,"/"),
                        kvs:append(Payment#'Payment'{account=Account,subaccount=SubAccount}, Feed) end, profit(C));
             {ok,_} -> skip
      end
    end, acc(C))
  end, plm_boot:products()).

inv_boot() ->
   lists:map(fun(#'Product'{id=C,code=Code}) ->
      Staff = kvs:all("/plm/"++C++"/staff"),
      Feed  = "/fin/acc/" ++ Code,
      Key   = C ++ "/options",
      io:format("INV: ~p",[{Feed,Key}]),
      {ok, #'Acc'{rate= Rate}=Acc} = kvs:get(Feed, Key),
      Hours = lists:foldl(fun (#'Person'{hours=A},Acc2) -> Acc2 + A end,0,Staff),
      lists:map(fun(#'Person'{cn=Person,hours=X}) ->
         Feed = "/fin/tx/" ++ Person ++ "/local",
         case kvs:get(writer,Feed) of
              {error,_} ->
                  lists:map(fun(#'Payment'{}=Pay) ->
                     Div = dec:'div'({money,0,X},{money,0,Hours}),
                     NewPay = rate(Pay,Acc#'Acc'{rate = dec:mul(Rate,Div)},C),
                     kvs:append(NewPay#'Payment'{account=Person,subaccount="local"},Feed) end,
                     kvs:all("/fin/tx/"++C++"/options"));
              {ok,_} -> skip
         end end, Staff)
   end, plm_boot:products()).
