-ifndef(BRANCH_HRL).
-define(BRANCH_HRL, true).

-include("dict/location.hrl").
-include("dict/person.hrl").

-record('Branch',   { id     = [] :: [] | binary(),
                      name   = [] :: list(),
                      org    = [] :: [] | binary(),
                      parent = [] :: [] | binary(),
                      short  = [] :: list(),
                      head   = [] :: [] | #'Person'{},
                      deputies   = [] :: list(#'Person'{}),
                      type   = [] :: [] | atom(),
                      lvl    = 1 :: integer(),
                      index  = [] :: [] | binary(),
                      loc    = [] :: [] | #'Loc'{} }).

-endif.
