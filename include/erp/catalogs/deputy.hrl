-ifndef(DEPUTY_HRL).
-define(DEPUTY_HRL, true).

-include_lib("schema/include/erp/catalogs/person.hrl").

-record('Deputy',    { id              = [] :: [] | binary(),
                       name            = [] :: [] | binary(),
                       party           = [] :: [] | binary(),
                       district_number = [] :: [] | integer(), 
                       index_number    = [] :: [] | integer(),
                       faction         = [] :: [] | binary(), 
                       start_date      = [] :: [] | calendar:datetime()
                     }).
-endif.
