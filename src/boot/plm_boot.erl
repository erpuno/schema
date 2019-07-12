-module(plm_boot).
-compile(export_all).
-include("person.hrl").
-include("product.hrl").
-include("payment.hrl").
-include("investment.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

'NYNJA'() ->
  {ok, NYNJA} = kvs:get("/erp/partners","NYNJA, Inc."),
  #'Product'{ code = "NYNJA",
              id = kvs:seq([],[]),
              organization = NYNJA,
              url          = "nynja.io",
              engineer     = #'Person'{cn = "Maxim Sokhatsky"},
              director     = #'Person'{cn = "Anton Andonov"},
              owner        = #'Person'{cn = "Salvator Guerrieri"},
              type         = virtual }.

'CATALX'() ->
  {ok, CATALX} = kvs:get("/erp/partners","Catalx Exchange Inc."),
  #'Product'{ code = "CATALX",
              id = kvs:seq([],[]),
              organization = CATALX,
              url          = "catalx.io",
              engineer     = #'Person'{cn = "Vyacheslav Kara"},
              director     = #'Person'{cn = "Anton Andonov"},
              owner        = #'Person'{cn = "Justin Kim"},
              type         = virtual }.

products() -> ['NYNJA'(), 'CATALX'()].

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

staff("CATALX") ->
   [ #'Person'{cn = "Nedelcho Delchev", hours = 8},
     #'Person'{cn = "Vyacheslav Kara", hours = 8}
   ].

assignees() ->
   lists:map(fun(#'Product'{code=C} = P) ->
      case kvs:get(writer,"/plm/"++C++"/staff") of
           {error,_} -> lists:map(fun(#'Person'{}=Person) ->
                        kvs:append(Person,"/plm/"++C++"/staff") end,staff(C));
           {ok,_} -> skip end
      end, products()).
