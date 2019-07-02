-ifndef(ORGANIZATION_HRL).
-define(ORGANIZATION_HRL, true).

-include("location.hrl").

-record('Organization', { name        = [] :: [] | binary(),
                          url         = [] :: [] | string(),
                          location    = [] :: [] | #'Location'{},
                          type        = [] :: term() }).

-endif.
