-module(fin_boot).
-compile(export_all).
-include("person.hrl").
-include("acc.hrl").
-include("product.hrl").
-include("payment.hrl").
-include("investment.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

boot() ->
   accounts(),
   inv_boot().

acc("NYNJA" = X) ->
   [ #'Acc'{id = X ++ "/insurance", rate = {2,70}},
     #'Acc'{id = X ++ "/options", rate = {2,10}},
     #'Acc'{id = X ++ "/reserved", rate = {2,10}},
     #'Acc'{id = X ++ "/R&D", rate = {2,10}}
   ];

acc("CATALX" = X ) ->
   [ #'Acc'{id = X ++ "/insurance", rate = {2,50}},
     #'Acc'{id = X ++ "/options", rate = {2,10}},
     #'Acc'{id = X ++ "/reserved", rate = {2,15}},
     #'Acc'{id = X ++ "/R&D", rate = {2,15}}
   ].

profit(C) ->
  lists:map(fun({#'Payment'{volume=Vo1,price=Pr1} = P1,
                 #'Payment'{volume=Vo2,price=Pr2} = P2}) ->
               P1#'Payment'{volume={0,1},price=dec:sub(dec:mul(Vo1,Pr1),dec:mul(Vo2,Pr2))}
        end, lists:zip(kvs:all("/plm/"++C++"/income"),
                       kvs:all("/plm/"++C++"/outcome"))).

rate(#'Payment'{price=P, volume=V}=Pay,#'Acc'{id=Id, rate=R}=Acc,C) ->
  Pay#'Payment'{invoice= kvs:seq([],[]), volume={0,1}, price=dec:mul(R,dec:mul(P,V))}.

accounts() ->
  lists:map(fun(#'Product'{code=C}) ->
    lists:map(fun(#'Acc'{id=Id}=SubAcc) ->
      Address = lists:concat(["/fin/acc/",C]),
      kvs:append(SubAcc,Address),
      Feed = lists:concat(["/fin/tx/",Id]),
      case kvs:get(writer, Feed) of
           {error,_} -> lists:map(fun(#'Payment'{}=Pay) ->
                        kvs:append(rate(Pay,SubAcc,C), Feed) end, profit(C));
             {ok,_} -> skip
      end
    end, acc(C))
  end, plm_boot:products()).

inv_boot() ->
   lists:map(fun(#'Product'{code=C}) ->
      {ok, #'Acc'{rate= Rate}=Acc} = kvs:get("/fin/acc/" ++ C, C ++ "/options"),
      Hours = lists:foldl(fun (#'Person'{hours=A},Acc) -> Acc + A end,0,kvs:all("/plm/"++C++"/staff")),
      io:format("Product: ~p Hours: ~p~n",[C,Hours]),
      lists:map(fun(#'Person'{cn=Person,hours=X}) ->
         Feed = "/fin/iban/" ++ Person,
         case kvs:get(writer,Feed) of
              {error,_} ->
                  lists:map(fun(#'Payment'{}=Pay) ->
                     Div = dec:'div'({0,X},{0,Hours}),
                     NewPay = rate(Pay,Acc#'Acc'{rate = dec:mul(Rate,Div)},C),
                     io:format("Person: ~p X: ~p Div: ~p Rate: ~p ~n",[Person,X,Div,Rate]),
                     kvs:append(NewPay,Feed) end, kvs:all("/fin/tx/"++C++"/options"));
              {ok,_} -> skip
         end end, kvs:all("/plm/"++C++"/staff"))
   end, plm_boot:products()).
