-module(pay_boot).
-export([boot/0]).
-include("dict/person.hrl").
-include("dict/product.hrl").
-include("dict/payment.hrl").
-include("dict/investment.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

payments("CATALX") ->
 [
  #'Payment' { invoice = "MAR-2019-PAY-CX", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2019-PAY-CX", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2019-PAY-CX", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2019-PAY-CX", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2019-PAY-CX", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto }
  ];

payments("FinaTech-Bynk") ->
 [#'Payment' { invoice = "JAN-2016-PAY-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2016-PAY-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2016-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2016-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2016-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2016-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2016-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2016-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2016-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2016-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2016-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2016-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },

  #'Payment' { invoice = "JAN-2017-PAY-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2017-PAY-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2017-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2017-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2017-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2017-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2017-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2017-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2017-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2017-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2017-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2017-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JAN-2018-PAY-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2018-PAY-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2018-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2018-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2018-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2018-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2018-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2018-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },

  #'Payment' { invoice = "JAN-2018-PAY-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2018-PAY-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2018-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2018-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2018-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2018-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2018-PAY-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2018-PAY-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2018-PAY-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto }

  ];

payments("FinaTech-Evoli") ->
 [#'Payment' { invoice = "JUL-2019-PAY-FTEV", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = fiat }
  ];

payments("FinaTech-Stamps") ->
 [
  #'Payment' { invoice = "JAN-2018-PAY-FTST", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2018-PAY-FTST", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2018-PAY-FTST", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2018-PAY-FTST", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2018-PAY-FTST", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2018-PAY-FTST", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2018-PAY-FTST", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2018-PAY-FTST", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2018-PAY-FTST", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto }
 ];

payments("NYNJA") ->
 [#'Payment' { invoice = "JAN-2019-PAY-NY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "FEB-2019-PAY-NY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAR-2019-PAY-NY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "APR-2019-PAY-NY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAY-2019-PAY-NY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = fiat }
  ];

payments(_) -> [].

salaries("NYNJA") ->
 [#'Payment' { invoice = "JAN-2019-SAL-NY", volume = {money,0,2000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "FEB-2019-SAL-NY", volume = {money,0,3000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAR-2019-SAL-NY", volume = {money,0,6000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "APR-2019-SAL-NY", volume = {money,0,8000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAY-2019-SAL-NY", volume = {money,0,11000}, price = {money,0,1}, instrument = "USD", type = fiat }
  ];

salaries("CATALX") ->
 [#'Payment' { invoice = "MAR-2019-SAL-CX", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "APR-2019-SAL-CX", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "MAY-2019-SAL-CX", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "JUN-2019-SAL-CX", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = fiat },
  #'Payment' { invoice = "JUL-2019-SAL-CX", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = fiat }
  ];

salaries("FinaTech-Bynk") ->
 [#'Payment' { invoice = "JAN-2016-SAL-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2016-SAL-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2016-SAL-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2016-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2016-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2016-SAL-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2016-SAL-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2016-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2016-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2016-SAL-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2016-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2016-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },

  #'Payment' { invoice = "JAN-2017-SAL-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2017-SAL-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2017-SAL-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2017-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2017-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2017-SAL-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2017-SAL-FTBY", volume = {money,0,10000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2017-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2017-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2017-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2017-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2017-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JAN-2018-SAL-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2018-SAL-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2018-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2018-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2018-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2018-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2018-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2018-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },

  #'Payment' { invoice = "JAN-2018-SAL-FTBY", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2018-SAL-FTBY", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2018-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2018-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2018-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2018-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "OCT-2018-SAL-FTBY", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "NOV-2018-SAL-FTBY", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "DEC-2018-SAL-FTBY", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto }

  ];

salaries("FinaTech-Evoli") ->
 [#'Payment' { invoice = "JUL-2019-SAL-FTEV", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = fiat }
  ];

salaries("FinaTech-Stamps") ->
 [
  #'Payment' { invoice = "JAN-2018-SAL-FTST", volume = {money,0,5000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "FEB-2018-SAL-FTST", volume = {money,0,7000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAR-2018-SAL-FTST", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "APR-2018-SAL-FTST", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "MAY-2018-SAL-FTST", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUN-2018-SAL-FTST", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "JUL-2018-SAL-FTST", volume = {money,0,150000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "AUG-2018-SAL-FTST", volume = {money,0,12000}, price = {money,0,1}, instrument = "USD", type = crypto },
  #'Payment' { invoice = "SEP-2018-SAL-FTST", volume = {money,0,15000}, price = {money,0,1}, instrument = "USD", type = crypto }
 ];

salaries(_) -> [].

products() -> plm_boot:products().

sal_boot() ->
   lists:map(fun(#'Product'{code=C} = _P) ->
      lists:map(fun(#'Payment'{}=Pay) -> kvs:append(Pay,"/plm/"++C++"/outcome") end,salaries(C))
      end, products()).

pay_boot() ->
   lists:map(fun(#'Product'{code=C} = _P) ->
      lists:map(fun(#'Payment'{}=Pay) -> kvs:append(Pay,"/plm/"++C++"/income") end,payments(C))
      end, products()).

boot() ->
    sal_boot(),
    pay_boot().

