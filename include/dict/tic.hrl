-ifndef(TIC_HRL).
-define(TIC_HRL, true).

-include("organization.hrl").

-type productType() :: virtual | physical.

-record('TIC', { name = [] :: [] | binary(),
                 capitalization = [] :: [] | integer(),
                 price = [] :: [] | integer(),
                 voume = [] :: [] | integer(),
                 type = [] :: productType() }).

-endif.
