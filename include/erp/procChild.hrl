-ifndef(PROCCHILD).
-define(PROCCHILD, true).

-record(procChild, {
        id = [] :: binary(),
        parent = [] :: binary(),
        module = [] :: atom()
     }).

-endif.
