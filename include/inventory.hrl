-ifndef(INVENTORY_HRL).
-define(INVENTORY_HRL, true).

-include("branch.hrl").

-record('Inventory',   { id          = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         branch      = [] :: [] | #'Branch'{},
                         type        = [] :: term() }).

-endif.
