-ifndef(BIZ_TASK_HRL).
-define(BIZ_TASK_HRL, true).

-include_lib("schema/include/erp/catalogs/person.hrl").
-include_lib("schema/include/erp/catalogs/location.hrl").
-include_lib("schema/include/erp/catalogs/assistantMark.hrl").
-include_lib("schema/include/erp/catalogs/sendInfo.hrl").

-record(bizTask, { id= [] :: binary(),
                   task_type = [] :: [] | list(),
                   initiator = [] :: [] | #'Person'{},
                   point=[] :: [] | list(),
                   content = [] :: list(),
                   document_type= <<"Задача"/utf8>> :: term(),
                   nomenclature=[] :: term(),
                   sign = [] :: [] | boolean(),
                   executor=[] :: [] | #'Person'{},
                   subexecutors = [] :: [] | list(#'Person'{}),
                   notify = [] :: [] | list(#'Person'{}),
                   fromDate = [] :: [] | calendar:datetime(),
                   dueDate = [] :: [] | calendar:datetime(),
                   dueDate_subexecutors = [] :: [] | calendar:datetime(),
                   priority = [] :: term(),
                   sent = #sendInfo{},
                   taskTime = [] :: integer(),
                   control=[] :: [] | boolean(),
                   period=[] :: [] | list(),
                   date_start=[] :: [] | calendar:datetime(),
                   date_finish=[] :: [] | calendar:datetime(),
                   date_control=[] :: [] | calendar:datetime(),
                   control_by=[] :: [] | list(#'Person'{}),
                   comment=[] :: [] | list(),
                   remove= false :: boolean(),
                   registered_by=[] :: [] | #'Person'{},
                   removed_by=[] :: [] | #'Person'{},
                   removed_date=[] :: [] | calendar:datetime(),
                   date_complete=[] :: [] | calendar:datetime(),
                   controller_comment=[] :: [] | list(),
                   complete_comment=[] :: [] | list(),
                   progress = [] :: [] | list(),
                   attachments = [] :: list(term()),
                   seq_id = [] :: list(),
                   parent = [] :: term(),
                   project = [] :: term(),
                   created_by = [] :: term(),
                   created = [] :: term(),
                   modified_by = [] :: term(),
                   modified = [] :: term(),
                   notifyTaskExist = false :: false | boolean(),
                   toAttention = #assistantMark{}
                 }).

-endif.
