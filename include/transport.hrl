-ifndef(TRANSPORT_HRL).
-define(TRANSPORT_HRL, true).

-include("organization.hrl").
-include("contract.hrl").

-type transportType() :: ship | cargo | flight.

-record('Transport',   { id          = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         provider    = [] :: [] | #'Organization'{},
                         contract    = [] :: [] | #'Contract'{},
                         type        = [] :: transportType() }).

-endif.
