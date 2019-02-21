-ifndef(WAREHOUSE_HRL).
-define(WAREHOUSE_HRL, true).

-record('Warehouse',   { id          = [] :: [] | binary(),
                         prev        = [] :: [] | binary(),
                         next        = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         type        = [] :: term() }).

-endif.
