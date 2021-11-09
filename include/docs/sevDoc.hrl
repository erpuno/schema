-ifndef(SEV_DOC_HRL).
-define(SEV_DOC_HRL, true).

-include("dict/person.hrl").

-record(sevRef, {guid = [] :: [] | binary(), regnum = [] :: [] | binary(), date = [] :: [] | calendar:datetime()}).

-record(sevExec, {id=[] :: binary(), erdpo=[]::term(), dueDate=[] :: term(), responsibility=0 :: integer()}).

-record(sevTask, {id= [] :: binary(),
                  guid= erp:guid() :: term(),
                  taskNum=[] :: term(),
                  title=[] :: term(),
                  desc=[] :: term(),
                  dueDate=[] :: term(),
                  date=[] :: term(),
                  control=[] :: [] | integer(),
                  executors=[] :: list(#sevExec{})
                 }).

-record(sevDoc, { id = [] :: binary(),
                guid = [] :: list(),

% NPA section

                stage = [] :: binary(),
                urn = [] :: binary(),
                actGuid = [] :: binary(),
                actType = [] :: binary(),
                name = [] :: binary(),
                description = [] :: binary(),
                isCreate = [] :: binary(),
                isCloseStage = [] :: binary(),
                stateRegNum = [] :: binary(),
                stateRegDate = [] :: binary(),
                approver_id = [] :: binary(),

% SEV section

                urgent=0 :: term(),
                date = [] :: [] | calendar:datetime(),  % registration_time
                created = [] :: [] | calendar:datetime(),
                sending_time = [] :: [] | calendar:datetime(),
                receiving_time = [] :: [] | calendar:datetime(),
                sessionid = [] :: [] | binary(),
                xml = [] :: [] | binary(),
                hash = [] :: binary() | list(),
                signature = [] :: binary() | list(),
                document_type=0 :: term(),
                registered_by=[] :: [] | #'Person'{},
                registering_time = [] :: [] | calendar:datetime(),
                purpose=[] :: term(),
                inAnswerTo=[] :: term(), % SEV Document
                tasks=[] :: term(),
                legal=[] :: term(),
                dueDate=[] :: term(), % SEV Approvals
                approval=[] :: term(), % {0,"Не погоджено"}, {1,"Погоджено"}, {2,"Погоджено із зауваженнями"}
                from=[] :: [] | list(),
                corr=[] :: [] | list(),
                sign=[] :: [] | list(),
                executor = [] :: [] | #'Person'{},
                branch = [] :: list(),
                head = [] :: [] | #'Person'{},
                content= [] :: list(),
                signed = [] :: list(#'Person'{}),
                send_type = [] :: list(),
                sent = no :: yes | no,
                sent_by =[] :: [] | #'Person'{},
                note=[] :: list(),
                attachments = [] :: list(term()),
                project = [] :: term(),
                proc_id = [] :: list(),
                kind = [] :: list(),
                annotation = [] :: list(),
                msg_type = [] :: term(),
                msg_acknow = "2" :: term(),
                ack_type = [] :: term(),
                created_by = [] :: term(),
                errorcode = "0" :: binary(),
                errortext = [] :: binary(),
                reg_number = [] :: term(),
                size = [] :: [] | binary(),
                modified_by = [] :: term(),
                modified = [] :: term()
              }).

-endif.
