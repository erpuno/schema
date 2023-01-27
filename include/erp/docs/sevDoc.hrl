-ifndef(SEV_DOC_HRL).
-define(SEV_DOC_HRL, true).

-include_lib("schema/include/erp/catalogs/project.hrl").
-include_lib("schema/include/erp/catalogs/person.hrl").

-record(sevRef, {id = [] :: [] | binary(), regnumber = [] :: [] | binary(), regdate = [] :: [] | calendar:datetime(), org = [] :: term(), pid = [] :: [] | binary()}).

-record(sevTask, {
                  id= [] :: binary(),
                  guid = [] :: binary(),
                  number = [] :: binary(),
                  title = [] :: binary(),
                  executor = [] :: [] | term(),
                  subexecutors = [] :: [] | list(),
                  notify = [] :: [] | list(),
                  control = false :: term(),
                  dueDate = [] :: [] | calendar:datetime(),
                  date = [] :: [] | calendar:datetime()
                 }).

-record(sevApprover, {
                       id = [] :: binary(),
                       guid = [] :: binary(),
                       org = [] :: term(),
                       dueDate = [] :: [] | calendar:datetime()
}).

-record(sendSevDoc, {
                id = [] :: binary(),
                guid = [] :: list(),
                urgent=false :: term(),
                date = [] :: [] | calendar:datetime(),
                title = [] :: [] | list(),
                sending_time = [] :: [] | calendar:datetime(),
                document_type= [] :: term(),
                purpose=[] :: term(),
                from=[] :: [] | list(),
                corr=[] :: [] | list(),
                sent = false :: term(),
                sent_by =[] :: [] | #'Person'{},
                attachments = [] :: list(term()),
                approvers = [] :: term(),
                tasks = [] :: list(),
                approval_status = [] :: term(),
                approval_comment = [] :: term(),
                referred = [] :: term(),
                referred_tasks = [] :: term(),
                project = [] :: term(),
                seq_id = [] :: list(),
                kind = <<"Лист"/utf8>> :: binary(),
                content = [] :: list(),
                main_sheets = [] :: term(),
                msg_type = [] :: term(),
                msg_acknow = [] :: term(),
                created_by = [] :: term(),
                errorcode = [] :: binary(),
                errortext = [] :: binary(),
                reg_number = [] :: term(),
                reg_date   = [] :: term(),
                out_reg_number = [] :: term(),
                out_reg_date = [] :: term(),
                modified_by = [] :: term(),
                modified = [] :: term()
              }).

-record(receiveSevDoc, {
            id = [] :: binary(),
            guid = [] :: list(),
            urgent= false :: boolean(),
            date = [] :: [] | calendar:datetime(),
            sending_time = [] :: [] | calendar:datetime(),
            document_type= [] :: term(),
            registered_by= [] :: [] | #'Person'{},
            registering_time = [] :: [] | calendar:datetime(),
            purpose=[] :: term(),
            from=[] :: [] | list(),
            corr=[] :: [] | list(),
            content= [] :: list(),
            main_sheets = [] :: term(),
            attachments = [] :: list(term()),
            project = #project{} :: #project{},
            seq_id = [] :: list(),
            kind = [] :: list(),
            approvers = [] :: term(),
            tasks = [] :: list(),
            approval_status = [] :: term(),
            approval_comment = [] :: term(),
            referred = [] :: term(),
            referred_tasks = [] :: term(),
            title = [] :: [] | binary(),
            reg_date = [] :: [] | tuple(),
            out_reg_date = [] :: [] | tuple(),
            msg_type = [] :: term(),
            errortext = [] :: binary(),
            reg_number = [] :: term(),
            out_reg_number = [] :: term(),
            modified_by = [] :: term(),
            modified = [] :: term()
          }).

-endif.
