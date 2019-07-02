-ifndef(DELIVERY_HRL).
-define(DELIVERY_HRL, true).

-include("transport.hrl").
-include("material.hrl").
-include("location.hrl").

-record('Delivery',   { id          = [] :: [] | binary(),
                        name        = [] :: [] | binary(),
                        transport   = [] :: [] | #'Transport'{},
                        material    = [] :: [] | #'Material'{},
                        source      = [] :: [] | #'Location'{},
                        destination = [] :: [] | #'Location'{},
                        type        = [] :: transportType() }).

-endif.
