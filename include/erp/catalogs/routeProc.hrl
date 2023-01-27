-ifndef(ROUTEPROC_HRL).
-define(ROUTEPROC_HRL, true).

-record('routeProc', { id = [] :: list(),
                       operation = [] :: [] | atom(),
                       feed = [] :: [] | binary(),
                       type = [] :: atom(),
                       folder = [] :: binary(),
                       users = [] :: binary() | list(),
                       folderType = <<"personal"/utf8>> :: binary(),
                       callback = [] :: [] | function(),
                       reject = false :: false | boolean(),
                       options = [] :: [] | list() }).

-endif.