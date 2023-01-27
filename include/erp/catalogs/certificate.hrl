-ifndef(CERTIFICATE_HRL).
-define(CERTIFICATE_HRL, true).

-include_lib("schema/include/erp/catalogs/employee.hrl").

-record('certificate', { id = [] :: [] | binary() | list(),
                         name = [] :: list() | binary(),
                         key_type = [] :: [] | list(),
                         key_instance = [] :: [] | list(),
                         key_password = [] :: [] | list(),
                         users = [] :: [] | list(#'Employee'{})
                      }).

-endif.
