-ifndef(LOCATION_HRL).
-define(LOCATION_HRL, true).

-include("organization.hrl").

-type locationType() :: normal | extra.

-record('Location',   { id          = [] :: [] | binary(),
                        name        = [] :: [] | binary(),
                        country     = [] :: [] | binary(),
                        city        = [] :: [] | binary(),
                        address     = [] :: [] | binary(),
                        organization= [] :: [] | #'Organization'{},
                        type        = [] :: locationType() }).

-endif.
