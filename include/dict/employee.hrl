-ifndef(EMPLOYEE_HRL).
-define(EMPLOYEE_HRL, true).

-include("dict/organization.hrl").
-include("dict/branch.hrl").
-include("dict/location.hrl").
-include("dict/person.hrl").

% Employee{cn="Кримчук Сергій",code="3916",person=Person}
% EmployeeCode{code="3916",cn="Кримчук Сергій"}

-record('Employee',    { id          = kvs:seq([],[]) :: term(),
                         person      = [] :: [] | #'Person'{},
                         org         = [] :: [] | #'Organization'{},
                         branch      = [] :: #'Branch'{} | list(),
                         code        = [],
                         surname     = [],
                         name        = [],
                         middle_name = [],
                         sex         = [],
                         birthday    = [],
                         hired       = [],
                         fired       = [],
                         inn         = [],
                         position    = [] :: list(),
                         number      = [],
                         title       = [] :: list(),
                         role        = [] :: list(),
                         substitute  = [] :: [] | #'Person'{},
                         substitutes = [] :: list(),
                         rightsDelegation = [] :: list() | term(),
                         phone       = [] :: list() | binary(),
                         mail        = [] :: list(),
                         status      = [] :: term(),
                         type        = [] :: term() }).

-record('EmployeeCode', { code       = [] :: [] | term(),
                          cn         = [] :: [] | term() }).

-endif.
