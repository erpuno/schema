-ifndef(ORGANIZATION_HRL).
-define(ORGANIZATION_HRL, true).

-record('Organization', { id          = [] :: [] | binary(),
                          prev        = [] :: [] | binary(),
                          next        = [] :: [] | binary(),
                          name        = [] :: [] | binary(),
                          url         = [] :: [] | string(),
                          type        = [] :: term() }).

-endif.
