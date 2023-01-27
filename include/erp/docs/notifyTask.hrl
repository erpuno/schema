-ifndef(NOTIFY_TASK_HRL).
-define(NOTIFY_TASK_HRL, true).

-record(notifyTask, { id = [] :: [] | binary(),
                   date = [] :: [] | calendar:datetime(),
                   type = [] :: [] | term(),
                   document_type= <<"Задача до відома"/utf8>> :: term(),
                   content = [] :: [] | binary(),
                   initiator = [] :: [] | term(),
                   registered_by = [] :: [] | term(),
                   notify = [] :: [] | term(),
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
