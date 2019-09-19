-ifndef(EMPLOYEE_HRL).
-define(EMPLOYEE_HRL, true).

-include("organization.hrl").
-include("branch.hrl").
-include("location.hrl").
-include("person.hrl").

-record('Employee',    { id          = begin timer:sleep(1), kvs:seq([],[]) end :: [] | binary(),
                         person      = [] :: [] | #'Person'{},
                         org         = [] :: [] | #'Organization'{},
                         branch      = [] :: [] | #'Branch'{},
                         role        = [] :: term(),
                         type        = [] :: term() }).

-endif.
