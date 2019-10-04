-ifndef(SALARY_HRL).
-define(SALARY_HRL, true).

-include("money.hrl").

-type salaryType() :: personal | group.

-record('Salary', { id = [] :: [] | term(),
                    volume = [] :: [] | money(),
                    price = {dec,0,1} :: money(),
                    instrument = [] :: term(),
                    type = [] :: salaryType(),
                    from = [] :: term(),
                    to = [] :: term(),
                    datetime = [] :: calendar:datetime() }).

-endif.
