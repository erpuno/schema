-ifndef(ACCESS_CONTROL_ID).
-define(ACCESS_CONTROL_ID, true).

-include("erp/catalogs/employee.hrl").
-include("erp/catalogs/organization.hrl").
-include("erp/catalogs/branch.hrl").
-include("erp/catalogs/fileDesc.hrl").
-include("erp/catalogs/orgEmail.hrl").
-include("erp/catalogs/orgEmail.hrl").
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
