-ifndef(INVENTORY_HRL).
-define(INVENTORY_HRL, true).

-include("branch.hrl").

-record('Inventory',   { id          = [] :: [] | binary(),
                         prev        = [] :: [] | binary(),
                         next        = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         branch      = [] :: [] | #'Branch'{},
                         type        = [] :: term() }).

-endif.
