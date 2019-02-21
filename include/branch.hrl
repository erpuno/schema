-ifndef(BRANCH_HRL).
-define(BRANCH_HRL, true).

-include("location.hrl").

-record('Branch',   { id          = [] :: [] | binary(),
                      prev        = [] :: [] | binary(),
                      next        = [] :: [] | binary(),
                      name        = [] :: [] | #'Location'{} }).

-endif.
