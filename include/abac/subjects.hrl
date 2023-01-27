-ifndef(SUBJECTS_HRL).
-define(SUBJECTS_HRL, true).

-record(subject_employee, {
                         id = [] :: [] | list() | binary(),
                         roles = [] :: [] | list(atom()),
                         routing = [] :: [] | list(),
                         substitute_type = any :: any | assistant | delegat,
                         status = [] :: [] | list(),
                         org = [] :: [] | list(),
                         branch = [] :: [] | list()
                       }).

-record(executor_status, { id = [] :: [] | atom(), routing = [] :: [] | atom() }).

-endif.


