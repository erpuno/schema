-ifndef(LOCATION_HRL).
-define(LOCATION_HRL, true).

-include("organization.hrl").

-record('Location',   { id          = [] :: [] | binary(),
                        name        = [] :: [] | binary(),
                        country     = [] :: [] | binary(),
                        city        = [] :: [] | binary(),
                        address     = [] :: [] | binary(),
                        organization= [] :: [] | #'Organization'{},
                        type        = [] :: materialType() }).

-endif.
