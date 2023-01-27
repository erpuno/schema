-ifndef(ACCESS_CONTROL_ID).
-define(ACCESS_CONTROL_ID, true).

-include_lib("schema/include/erp/catalogs/employee.hrl").
-include_lib("schema/include/erp/catalogs/organization.hrl").
-include_lib("schema/include/erp/catalogs/branch.hrl").
-include_lib("schema/include/erp/catalogs/fileDesc.hrl").
-include_lib("schema/include/erp/catalogs/orgEmail.hrl").
-include_lib("schema/include/erp/catalogs/orgEmail.hrl").
-include_lib("bpe/include/bpe.hrl").

-record(access, {cn, msg, head}).

-record(rightsDelegation, {
  id = [] :: list(),
  user = [] :: binary() | list(),
  delegateTo = [] :: binary() | list(),
  startTime = [] :: [] | calendar:datetime(),
  endTime = [] :: [] | calendar:datetime(),
  accessRules = [] :: term(),
  rightsDelegation = [] :: [] | boolean(),
  tempDutiesPerform = [] :: [] | boolean(),
  status = active :: active | canceled | expired,
  org = [] :: binary(),
  note = [] :: binary()
}).

-record(assistant, {
  id = [] :: list(),
  head = [] :: binary() | list(),
  assistants = [] :: binary() | list(),
  startTime = [] :: [] | calendar:datetime(),
  endTime = [] :: [] | calendar:datetime(),
  status = active :: active | canceled | expired
}).

-endif.
