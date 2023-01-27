-ifndef(CONTROL_TASK_HRL).
-define(CONTROL_TASK_HRL, true).

-record(controlTask, { id = [] :: [] | binary(),
                   date = [] :: [] | calendar:datetime(),
                   type = [] :: [] | term(),
                   document_type= <<"Задача контролю"/utf8>> :: term(),
                   content = [] :: [] | binary(),
                   initiator = [] :: [] | term(),
                   registered_by = [] :: [] | term(),
                   control = [] :: [] | term(),
                   dueDate = [] :: [] | calendar:datetime(),
                   created = [] :: [] | term(),
                   created_by = [] :: [] | term(),
                   modified = [] :: [] | term(),
                   modified_by = [] :: [] | term(),
                   seq_id = [] :: [] | binary(),
                   project = [] :: [] | term(),
                   attachments = [] :: [] | list()
                 }).


-endif.
