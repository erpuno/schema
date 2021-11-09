-ifndef(ADDRESS_HRL).
-define(ADDRESS_HRL, true).

-include_lib("schema/include/dict/location.hrl").

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


-record('AdressName', { name = [] :: [] | binary(),
                        id = [] :: [] | term() }).

-endif.
