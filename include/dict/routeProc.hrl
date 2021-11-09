-ifndef(ROUTEPROC_HRL).
-define(ROUTEPROC_HRL, true).

-record('routeProc', { id = [] :: list(),
                       folder = [] :: binary(),
                       users = [] :: binary() | list()}).

-endif.