-ifndef(INVENTORY_HRL).
-define(INVENTORY_HRL, true).

-include("organization.hrl").

-record('Inventory',   { id          = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         manufacturer= [] :: [] | #'Organization'{},
                         type        = [] :: term() }).

-endif.
