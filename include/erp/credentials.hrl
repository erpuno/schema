-ifndef(CREDENTIALS_HRL).
-define(CREDENTIALS_HRL, true).

-include_lib("schema/include/erp/catalogs/organization.hrl").
-include_lib("schema/include/erp/catalogs/branch.hrl").
-include_lib("schema/include/erp/catalogs/employee.hrl").

-record(credentials, { key_type     = []    :: binary(),
                       key_instance = []    :: binary(),
                       otp          = []    :: binary(),
                       auth_type    = []    :: atom(),
                       fired        = false :: boolean(),
                       employee     = []    :: [] | #'Employee'{} }).
-endif.
