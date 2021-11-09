-ifndef(GENERATE_HRL).
-define(GENERATE_HRL, true).

-record('genReport', { id       = kvs:seq([],[]) :: [] | binary() | list(),
                       type     = [] :: [] | binary(),
                       userName = [] :: [] | binary(),
                       from     = [] :: [] | calendar:datetime(),
                       to       = [] :: [] | calendar:datetime()
        }).

-endif.