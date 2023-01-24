-ifndef(ORG_DOC_HRL).
-define(ORG_DOC_HRL, true).

-include("dict/project.hrl").
-include("dict/person.hrl").

-record(orgDoc,  { id= [] :: binary(),
                   urgent = false :: false | boolean(),
                   date = [] :: [] | calendar:datetime(),
                   document_type = [] :: tuple(),
                   nomenclature=[] :: term(),
                   branch=[] :: [] | list(),
                   head=[] :: [] | #'Person'{},
                   executor=[] :: [] | #'Person'{},
                   content=[] :: [] | list(),
                   approvers = [] :: list(#'Person'{}),
                   signatory = [] :: [] | list(#'Person'{}),
                   target = [] :: [] | list(#'Person'{}),
                   target_notify = [] :: [] | list(#'Person'{}),
                   dueDate = [] :: [] | calendar:datetime(),
                   canceled = false :: false | boolean(),
                   cancelDate = [] :: [] | calendar:datetime(),
                   editDate = [] :: [] | calendar:datetime(),
                   note = [] :: list(),
                   registered_by=[] :: [] | #'Person'{},
                   attachments = [] :: list(term()),
                   project = [] :: [] | #project{},
                   seq_id = [] :: list(),
                   created_by = [] :: term(),
                   created = [] :: term(),
                   modified_by = [] :: term(),
                   modified = [] :: term(),
                   template = [] :: term(),
                   bizTask_initiator = [] :: term(),
                   toAttention = []
}).

-endif.
