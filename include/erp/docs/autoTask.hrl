-ifndef(AUTO_TASK_HRL).
-define(AUTO_TASK_HRL, true).

-include_lib("schema/include/erp/catalogs/assistantMark.hrl").
-include_lib("schema/include/erp/catalogs/sendInfo.hrl").

-record(autoTask, { id = [] :: [] | binary(),
                   date = [] :: [] | calendar:datetime(),
                   type = [] :: [] | term(),
                   document_type= <<"Автозадача"/utf8>> :: term(),
                   content = [] :: [] | binary(),
                   initiator = [] :: [] | term(),
                   registered_by = [] :: [] | term(),
                   executor = [] :: [] | term(),
                   notify = [] :: [] | term(),
                   dueDate = [] :: [] | calendar:datetime(),
                   created = [] :: [] | term(),
                   created_by = [] :: [] | term(),
                   modified = [] :: [] | term(),
                   modified_by = [] :: [] | term(),
                   sent = #sendInfo{},
                   toAttention = #assistantMark{},
                   seq_id = [] :: [] | binary(),
                   project = [] :: [] | term(),
                   attachments = [] :: [] | list()
                 }).


-endif.
