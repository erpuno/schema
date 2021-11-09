-ifndef(SALARY_HRL).
-define(SALARY_HRL, true).

-include_lib("dec/include/dec.hrl").

-type salaryType() :: personal | group.

-record('Salary', { id = [] :: [] | term(),
                    volume = [] :: [] | dec:money(),
                    price = {money,0,1} :: #money{},
                    instrument = [] :: term(),
                    type = [] :: salaryType(),
                    from = [] :: term(),
                    to = [] :: term(),
                    datetime = [] :: calendar:datetime() }).

-endif.
