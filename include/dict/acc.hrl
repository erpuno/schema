-ifndef(ACC_HRL).
-define(ACC_HRL, true).

-record('Acc', { id   = [] :: [] | binary() | list(),
                 type = [] :: [] | atom(),
                 ballance = {money,0,0} :: dec:money(),
                 rate = {money,0,0} :: dec:money() }).

-endif.
