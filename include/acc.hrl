-ifndef(ACC_HRL).
-define(ACC_HRL, true).

-include("money.hrl").

-record('Acc', { id   = [] :: [] | binary() | list(),
                 type = [] :: [] | atom(),
                 ballance = {'Dec',0,0} :: dec:money(),
                 rate = {'Dec',0,0} :: money() }).

-endif.
