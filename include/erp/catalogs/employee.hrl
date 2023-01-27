-ifndef(EMPLOYEE_HRL).
-define(EMPLOYEE_HRL, true).

-include("erp/catalogs/organization.hrl").
-include("erp/catalogs/branch.hrl").
-include("erp/catalogs/location.hrl").
-include("erp/catalogs/person.hrl").

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
                         group       = [] :: list(),
                         role        = [] :: list(atom()),
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
