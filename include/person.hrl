-ifndef(PERSON_HRL).
-define(PERSON_HRL, true).

-record('Person',      { id          = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         org         = [] :: [] | integer(),
                         type        = [] :: term() }).

-endif.
