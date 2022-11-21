-module(plm_boot).
-compile(export_all).
-export([boot/0]).
-include("dict/person.hrl").
-include("dict/product.hrl").
-include("dict/payment.hrl").
-include("dict/investment.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

'NYNJA'() ->
  {ok, NYNJA} = kvs:get("/erp/partners","NYNJA, Inc."),
  #'Product'{ id = "NYNJA",
              code = kvs:seq([],[]),
              organization = NYNJA,
              url          = "nynja.io",
              engineer     = #'Person'{cn = "Maxim Sokhatsky"},
              director     = #'Person'{cn = "Anton Andonov"},
              owner        = #'Person'{cn = "Salvator Guerrieri"},
              type         = virtual }.

'CATALX'() ->
  {ok, CATALX} = kvs:get("/erp/partners","Catalx Exchange Inc."),
  #'Product'{ id = "CATALX",
              code = kvs:seq([],[]),
              organization = CATALX,
              url          = "catalx.io",
              engineer     = #'Person'{cn = "Vyacheslav Kara"},
              director     = #'Person'{cn = "Anton Andonov"},
              owner        = #'Person'{cn = "Justin Kim"},
              type         = virtual }.

'FinaTech-Evoli'() ->
  {ok, FinaTech} = kvs:get("/erp/partners","FinaTech"),
  #'Product'{ id = "FinaTech-Evoli",
              code = kvs:seq([],[]),
              organization = FinaTech,
              url          = "finatech.se",
              engineer     = #'Person'{cn = "Vyacheslav Kara"},
              director     = #'Person'{cn = "Anton Andonov"},
              owner        = #'Person'{cn = "FinaTech CEO"},
              type         = virtual }.

'FinaTech-Stamps'() ->
  {ok, FinaTech} = kvs:get("/erp/partners","FinaTech"),
  #'Product'{ id = "FinaTech-Stamps",
              code = kvs:seq([],[]),
              organization = FinaTech,
              url          = "finatech.se",
              engineer     = #'Person'{cn = "Vyacheslav Kara"},
              director     = #'Person'{cn = "Anton Andonov"},
              owner        = #'Person'{cn = "FinaTech CEO"},
              type         = virtual }.

'FinaTech-Bynk'() ->
  {ok, FinaTech} = kvs:get("/erp/partners","FinaTech"),
  #'Product'{ id = "FinaTech-Bynk",
              code = kvs:seq([],[]),
              organization = FinaTech,
              url          = "finatech.se",
              engineer     = #'Person'{cn = "Vyacheslav Kara"},
              director     = #'Person'{cn = "Anton Andonov"},
              owner        = #'Person'{cn = "FinaTech CEO"},
              type         = virtual }.

products() ->
  [
    'NYNJA'(),
    'CATALX'(),
    'FinaTech-Bynk'(),
    'FinaTech-Stamps'(),
    'FinaTech-Evoli'()
  ].

boot() ->
  plm_boot(),
  assignees().

plm_boot() ->
    case kvs:get(writer,"/plm/products") of
        {error,_} -> lists:map(fun(#'Product'{} = P) -> kvs:append(P,"/plm/products") end, products());
           {ok,_} -> skip end.

staff("NYNJA") ->
   [ #'Person'{cn = "Georgi Spasov", hours = 8},
     #'Person'{cn = "Radostin Dimitrov", hours = 4},
     #'Person'{cn = "Nikolay Dimitrov", hours = 4},
     #'Person'{cn = "Yuri Maslovsky", hours = 8},
     #'Person'{cn = "Igor Kharin", hours = 8},
     #'Person'{cn = "Maxim Sokhatsky", hours = 1}
   ];

staff("FinaTech-Evoli") ->
   [ #'Person'{cn = "Teodor Radev", hours = 8},
     #'Person'{cn = "Pavel Petrov", hours = 4}
   ];

staff("FinaTech-Stamps") ->
   [ #'Person'{cn = "Stanislav Dimov", hours = 8},
     #'Person'{cn = "Stanislav Genchev", hours = 4}
   ];

staff("FinaTech-Bynk") ->
   [ #'Person'{cn = "Vyacheslav Kara", hours = 8},
     #'Person'{cn = "Stanislav Genchev", hours = 4}
   ];

staff("CATALX") ->
   [ #'Person'{cn = "Nedelcho Delchev", hours = 8},
     #'Person'{cn = "Vyacheslav Kara", hours = 8}
   ];

staff(_) -> [].

assignees() ->
   lists:map(fun(#'Product'{code=C} = _P) ->
      Feed = "/plm/"++C++"/staff",
      case kvs:get(writer,Feed) of
           {error,_} -> lists:map(fun(#'Person'{cn=CN}=Person) ->
                        Id = kvs:seq([],[]),
                        io:format("Person: ~p CN: ~p~n",[Id,CN]),
                        kvs:append(Person#'Person'{id=Id},"/plm/"++C++"/staff") end,staff(C));
           {ok,_} -> skip end
      end, products()).
