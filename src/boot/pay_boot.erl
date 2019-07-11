-module(pay_boot).
-compile(export_all).
-include("person.hrl").
-include("product.hrl").
-include("payment.hrl").
-include("investment.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

payments("CATALX") ->
 [#'Payment' { invoice = "JAN-2018-PAY-CX", volume = {0,5000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2018-PAY-CX", volume = {0,7000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2018-PAY-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2018-PAY-CX", volume = {0,12000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2018-PAY-CX", volume = {0,15000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2018-PAY-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2018-PAY-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2018-PAY-CX", volume = {0,12000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2018-PAY-CX", volume = {0,15000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2018-PAY-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2018-PAY-CX", volume = {0,12000}, price = {0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2018-PAY-CX", volume = {0,15000}, price = {0,1}, instrument = "USD", type = crypto }
  ];

payments("NYNJA") ->
 [#'Payment' { invoice = "JAN-2019-PAY-NY", volume = {0,5000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "FEB-2019-PAY-NY", volume = {0,7000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAR-2019-PAY-NY", volume = {0,10000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "APR-2019-PAY-NY", volume = {0,12000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAY-2019-PAY-NY", volume = {0,15000}, price = {0,1}, instrument = "USD", type = fiat }
  ].

salaries("NYNJA") ->
 [#'Payment' { invoice = "JAN-2019-SAL-NY", volume = {0,2000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "FEB-2019-SAL-NY", volume = {0,3000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAR-2019-SAL-NY", volume = {0,6000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "APR-2019-SAL-NY", volume = {0,8000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAY-2019-SAL-NY", volume = {0,11000}, price = {0,1}, instrument = "USD", type = fiat }
  ];

salaries("CATALX") ->
 [#'Payment' { invoice = "JAN-2018-SAL-CX", volume = {0,3000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "FEB-2018-SAL-CX", volume = {0,5000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAR-2018-SAL-CX", volume = {0,7000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "APR-2018-SAL-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAY-2018-SAL-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "JUN-2018-SAL-CX", volume = {0,7000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "JUL-2018-SAL-CX", volume = {0,7000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "AUG-2018-SAL-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "SEP-2018-SAL-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "OCT-2018-SAL-CX", volume = {0,8000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "NOV-2018-SAL-CX", volume = {0,10000}, price = {0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "DEC-2018-SAL-CX", volume = {0,14000}, price = {0,1}, instrument = "USD", type = fiat }
  ].

investments("NYNJA") ->
 [#'Investment' { id = "INV-NY-0912", volume = {0,100}, price = {0,100}, instrument = "SWAP", type = exchange,
                  from = "Maxim Sokhatsky" },
  #'Investment' { id = "INV-NY-0913", volume = {0,300}, price = {0,100}, instrument = "SWAP", type = exchange,
                  from = "Anton Andonov" }
  ];

investments("CATALX") ->
 [#'Investment' { id = "INV-CX-1233", volume = {0,300}, price = {0,500}, instrument = "SWAP", type = exchange,
                  from = "Vyacheslav Kara" },
  #'Investment' { id = "INV-CX-1234", volume = {0,500}, price = {0,500}, instrument = "SWAP", type = exchange,
                  from = "Vyacheslav Kara" },
  #'Investment' { id = "INV-CX-1235", volume = {0,700}, price = {0,500}, instrument = "SWAP", type = exchange,
                  from = "Vyacheslav Kara" },
  #'Investment' { id = "INV-CX-1236", volume = {0,100}, price = {0,500}, instrument = "SWAP", type = exchange,
                  from = "Vyacheslav Kara" }
  ].

products() -> plm_boot:products().

inv_boot() ->
   lists:map(fun(#'Product'{code=C} = P) ->
      lists:map(fun(#'Investment'{}=Pay) -> kvs:append(Pay,"/plm/"++C++"/investments") end,investments(C))
      end, products()).

sal_boot() ->
   lists:map(fun(#'Product'{code=C} = P) ->
      lists:map(fun(#'Payment'{}=Pay) -> kvs:append(Pay,"/plm/"++C++"/outcome") end,salaries(C))
      end, products()).

pay_boot() ->
   lists:map(fun(#'Product'{code=C} = P) ->
      lists:map(fun(#'Payment'{}=Pay) -> kvs:append(Pay,"/plm/"++C++"/income") end,payments(C))
      end, products()).

boot() ->
    inv_boot(),
    sal_boot(),
    pay_boot().

