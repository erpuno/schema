-ifndef(TABINFO_HRL).
-define(TABINFO_HRL, true).

-record('tabInfo', { id = [] :: list(),
                     name = [] :: binary() | list(),
                     order = [] :: term(),
                     tabName = [] :: term(),
                     tableName = [] :: term(),
                     headerName = [] :: term(),
                     rowsName = [] :: term(),
                     feed = [] :: term(),
                     type = [] :: term(),
                     roles = [] :: term()
                   }).

-endif.
