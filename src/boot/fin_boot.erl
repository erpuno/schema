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

payments(C) -> kvs:all("/plm/"++C++"/income").

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
                        kvs:append(rate(Pay,SubAcc,C), Feed) end, payments(C));
             {ok,_} -> skip
      end
    end, acc(C))
  end, plm_boot:products()).

inv_boot() ->
   lists:map(fun(#'Product'{code=C}) ->
      {ok, #'Acc'{rate= Rate}=Acc} = kvs:get("/fin/acc/" ++ C, C ++ "/options"),
      Hours = lists:foldl(fun (#'Person'{hours=A},Acc) -> Acc + A end,0,kvs:all("/plm/"++C++"/staff")),
      Feed = "/plm/"++C++"/investments",
      case kvs:get(writer,Feed) of
           {error,_} -> lists:map(fun(#'Person'{cn=Person,hours=X}) ->
                        lists:map(fun(#'Payment'{}=Pay) ->
                        Div = dec:'div'({0,X},{0,Hours}),
                        NewPay = rate(Pay,Acc#'Acc'{rate = dec:mul(Rate,Div)},C),
                        io:format("Pay ~p ~p/~p = ~p~n",[Person,Hours,X,NewPay]),
                        kvs:append(NewPay,"/fin/iban/" ++ Person) end,
                        kvs:all("/fin/tx/"++C++"/options")) end,
                        kvs:all("/plm/"++C++"/staff"));
              {ok,_} -> skip end  end, plm_boot:products()).
