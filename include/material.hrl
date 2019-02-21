-ifndef(MATERIAL_HRL).
-define(MATERIAL_HRL, true).

-type materialType() :: copper | silver | gold | iron | aluminium.
-type granularity() :: kg | tonn.

-record('Material',   { id          = [] :: [] | binary(),
                        prev        = [] :: [] | binary(),
                        next        = [] :: [] | binary(),
                        name        = [] :: [] | binary(),
                        units       = [] :: [] | granularity(),
                        amount      = [] :: [] | integer(),
                        qualily     = [] :: [] | integer(),
                        type        = [] :: materialType() }).

-endif.
