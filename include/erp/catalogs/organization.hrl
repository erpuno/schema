-ifndef(ORGANIZATION_HRL).
-define(ORGANIZATION_HRL, true).

-include("erp/catalogs/location.hrl").

-record('Organization', { id = [] :: list(),
                          name        = [] :: [] | binary(),
                          details     = [] :: [] | binary(),
                          hq          = "00000" :: term(),
                          orgname     = [] :: [] | binary(),
                          address     = [] :: [] | binary(),
                          house       = [] :: [] | binary(),
                          director    = [] :: [] | term(),
                          position    = [] :: [] | binary(),
                          phones      = [] :: list() | binary(),
                          fax         = [] :: list() | binary(),
                          url         = [] :: [] | string(),
                          code        = [] :: list() | binary(),
                          login       = [] :: [] | binary(),
                          password    = [] :: [] | binary(),
                          location    = [] :: [] | #'Loc'{},
                          type        = [] :: term(),
                          keys        = 50 :: integer(),
                          email       = [] :: [] | binary(),
                          feed        = [] :: [] | binary(),
                          sendType    = [] :: [] | term() }).

-endif.
