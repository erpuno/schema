-ifndef(DEED_CAT_HRL).
-define(DEED_CAT_HRL, true).

-record(deedCat, { id   = kvs:seq([],[]) :: term(),
                   code = [] :: [] | binary() | list(),
                   type = [] :: [] | binary() | list(),
                   name = [] :: [] | term()
                 }).

-endif.