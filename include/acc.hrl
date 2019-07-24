-ifndef(ACC_HRL).
-define(ACC_HRL, true).

-include("money.hrl").

-record('Acc', { id   = [] :: [] | binary() | list(),
                 type = [] :: [] | atom(),
                 ballance = {0,0} :: dec:money(),
                 rate = {0,0} :: money() }).

-endif.
