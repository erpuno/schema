-ifndef(BRANCH_HRL).
-define(BRANCH_HRL, true).

-include("location.hrl").

-record('Branch',   { id     = kvs:seq([],[]) :: [] | binary(),
                      loc    = [] :: [] | #'Location'{} }).

-endif.
