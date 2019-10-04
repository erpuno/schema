-ifndef(ACC_HRL).
-define(ACC_HRL, true).

-include("money.hrl").

-record('Acc', { id   = [] :: [] | binary() | list(),
                 type = [] :: [] | atom(),
                 ballance = {money,0,0} :: dec:money(),
                 rate = {money,0,0} :: money() }).

-endif.
