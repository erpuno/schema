-ifndef(INVESTMENT_HRL).
-define(INVESTMENT_HRL, true).

-include_lib("dec/include/dec.hrl").

-type investmentType() :: stock | bond | mutual | index | exchange | option.

-record('Investment', { id = [] :: [] | term(),
                        volume = [] :: [] | dec:money(),
                        price = {money,0,1} :: dec:money(),
                        instrument = [] :: term(),
                        type = [] :: investmentType(),
                        from = [] :: term(),
                        to = [] :: term() }).

-endif.
