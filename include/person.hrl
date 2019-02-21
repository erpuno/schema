-ifndef(PERSON_HRL).
-define(PERSON_HRL, true).

-record('Person',      { id          = [] :: [] | binary(),
                         prev        = [] :: [] | binary(),
                         next        = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         org         = [] :: [] | integer(),
                         type        = [] :: term() }).

-endif.
