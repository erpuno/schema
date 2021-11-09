-ifndef(BIZ_TASK_HRL).
-define(BIZ_TASK_HRL, true).

-include("dict/person.hrl").
-include("dict/location.hrl").

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
                   reminder = [] :: term(),
                   taskTime = [] :: integer(),
                   control=[] :: [] | boolean(),
                   period=[] :: [] | list(),
                   date_start=[] :: [] | calendar:datetime(),
                   date_finish=[] :: [] | calendar:datetime(),
                   date_control=[] :: [] | calendar:datetime(),
                   control_by=[] :: [] | list(#'Person'{}),
                   comment=[] :: [] | list(),
                   remove= true,
                   registered_by=[] :: [] | #'Person'{},
                   removed_by=[] :: [] | #'Person'{},
                   removed_date=[] :: [] | calendar:datetime(),
                   date_complete=[] :: [] | calendar:datetime(),
                   controller_comment=[] :: [] | list(),
                   complete_comment=[] :: [] | list(),
                   progress = [] :: [] | list(),
                   attachments = [] :: list(term()),
                   proc_id = [] :: list(),
                   parent = [] :: term(),
                   project = [] :: term(),
                   created_by = [] :: term(),
                   created = [] :: term(),
                   modified_by = [] :: term(),
                   modified = [] :: term()
                 }).

-endif.
