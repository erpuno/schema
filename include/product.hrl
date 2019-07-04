-ifndef(PRODUCT_HRL).
-define(PRODUCT_HRL, true).

-include("organization.hrl").

-type productType() :: virtual | physical.

-record('Product', { code         = [] :: [] | term(),
                     id           = kvs:seq([],[]) :: [] | binary(),
                     organization = [] :: [] | #'Organization'{},
                     engineer     = [] :: [] | #'Person'{},
                     director     = [] :: [] | #'Person'{},
                     owner        = [] :: [] | #'Person'{},
                     type         = [] :: productType() }).

-endif.
