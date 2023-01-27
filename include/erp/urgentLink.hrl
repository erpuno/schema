-ifndef(URGENTLINK).
-define(URGENTLINK, true).

-record(urgentLink, {
        id = [] :: binary(),
        deadline = [] :: tuple(),
        urgent = [] :: atom(),
        users = [] :: [] | list()
     }).

-endif.
