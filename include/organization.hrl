-ifndef(ORGANIZATION_HRL).
-define(ORGANIZATION_HRL, true).

-record('Organization', { id          = [] :: [] | binary(),
                          name        = [] :: [] | binary(),
                          type        = [] :: term() }).

-endif.
