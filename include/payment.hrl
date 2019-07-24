-ifndef(PAYMENT_HRL).
-define(PAYMENT_HRL, true).

-include("money.hrl").

-type paymentType() :: fiat | crypto.

-record('Payment', { invoice = [] :: [] | term(),
                     account = [] :: term(),
                     subaccount = [] :: term(),
                     volume = [] :: [] | money(),
                     price = {0,1} :: money(),
                     instrument = [] :: term(),
                     type = [] :: paymentType(),
                     from = [] :: term(),
                     to = [] :: term() }).

-endif.
