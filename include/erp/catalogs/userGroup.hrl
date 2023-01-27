-ifndef(USERGROUP_HRL).
-define(USERGROUP_HRL, true).

-record('userGroup', { id = [] :: list(),
                       document = [] :: [] | binary(),
                       type = [] :: [] | list(),
                       name = [] :: [] | binary(),
                       users = [] :: list()}).

-endif.