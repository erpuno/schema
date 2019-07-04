-ifndef(PRODUCT_HRL).
-define(PRODUCT_HRL, true).

-include("organization.hrl").

-type productType() :: virtual | physical.

-record('Product', { id           = kvs:seq([],[]) :: [] | binary(),
                     code         = [] :: [] | term(),
                     organization = [] :: [] | #'Organization'{},
                     engineer     = [] :: [] | #'Person'{},
                     director     = [] :: [] | #'Person'{},
                     owner        = [] :: [] | #'Person'{},
                     type         = [] :: productType() }).

-endif.
