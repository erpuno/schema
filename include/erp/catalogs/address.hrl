-ifndef(ADDRESS_HRL).
-define(ADDRESS_HRL, true).

-include("erp/catalogs/location.hrl").

-record('Address', { id            = kvs:seq([],[]) :: term(),
                     name          = [] :: [] | binary(),
                     country       = <<"Україна"/utf8>> :: [] | binary(),
                     region        = [] :: [] | binary(),
                     distinct      = [] :: [] | binary(),
                     locality      = [] :: [] | binary(),
                     postindex     = [] :: [] | binary(),
                     house_numbers = [] :: [] | list(),
                     number        = [] :: [] | binary(),
                     type          = [] :: term() }).


-record('Addr', { id            = [] :: [] | binary(),
                  parent_id     = [] :: [] | binary(),
                  name          = [] :: [] | binary(),
                  koatuu        = [] :: [] | binary(),
                  katottg       = [] :: [] | binary(),
                  post_code     = [] :: [] | binary(),
                  ukr_post      = [] :: [] | binary(),
                  kind          = [] :: [] | number(),
                  abbreviation  = [] :: [] | binary(),
                  loc_id        = [] :: [] | binary(),
                  loc_name      = [] :: [] | binary(),
                  path          = [] :: [] | binary(),
                  house_numbers = [] :: [] | list()
                }).

-endif.
