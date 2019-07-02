-ifndef(LOCATION_HRL).
-define(LOCATION_HRL, true).

-type locationType() :: normal | extra.

-record('Location',   { id          = kvs:seq([],[]) :: [] | binary(),
                        code        = [] :: [] | term(),
                        country     = [] :: [] | binary(),
                        city        = [] :: [] | binary(),
                        address     = [] :: [] | binary(),
                        type        = [] :: locationType() }).

-endif.
