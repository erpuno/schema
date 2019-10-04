-ifndef(PAYMENT_HRL).
-define(PAYMENT_HRL, true).

-include("money.hrl").

-type paymentType() :: fiat | crypto.

-record('Payment', { invoice = [] :: [] | term(),
                     account = [] :: term(),
                     subaccount = [] :: term(),
                     volume = [] :: [] | money(),
                     price = {dec,0,1} :: money(), % <<"{0,1}">> ==> epp:parse(ErlangTerm)
                     instrument = [] :: term(),
                     type = [] :: paymentType(),
                     from = [] :: term(),
                     to = [] :: term() }).

-endif.
