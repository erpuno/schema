-ifndef(INVESTMENT_HRL).
-define(INVESTMENT_HRL, true).

-include("money.hrl").

-type investmentType() :: stock | bond | mutual | index | exchange | option.

-record('Investment', { id = [] :: [] | term(),
                        volume = [] :: [] | money(),
                        price = {dec,0,1} :: money(),
                        instrument = [] :: term(),
                        type = [] :: investmentType(),
                        from = [] :: term(),
                        to = [] :: term() }).

-endif.
