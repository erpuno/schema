-ifndef(HOLIDAY_HRL).
-define(HOLIDAY_HRL, true).

-record(holiday, {id    = [] :: [] | binary() | list(),
                  date  = [] :: [] | calendar:datetime(),
                  value = [] :: [] | boolean()}).

-endif.