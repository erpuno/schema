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
    case kvs:get(writer,"/plm/products") of
        {error,_} -> lists:map(fun(#'Product'{} = P) -> kvs:append(P,"/plm/products") end, products());
           {ok,_} -> skip end.
