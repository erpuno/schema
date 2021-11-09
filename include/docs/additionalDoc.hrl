-ifndef(ADDITIONAL_DOC_HRL).
-define(ADDITIONAL_DOC_HRL, true).

-include("dict/person.hrl").

-record(additionalDoc, { id= [] :: binary(),
                         guid= [] :: list(),
                         date = [] :: [] | calendar:datetime(),
                         xml = [] :: [] | binary(),
                         hash = [] :: binary() | list(),
                         signature = [] :: binary() | list(),
                         document_type= <<"Додатковий документ"/utf8>> :: term(),
                         nomenclature=[] :: term(),
                         corr=[] :: [] | #'Person'{},
                         executor=[] :: [] | #'Person'{},
                         branch=[] :: [] | list(),
                         head=[] :: [] | list(),
                         content=[] :: [] | list(),
                         signatory = [] :: [] | list(#'Person'{}),
                         control = [] :: [] | #'Person'{},
                         note = [] :: list(),
                         attachments = [] :: list(term()),
                         registered_by=[] :: [] | #'Person'{},
                         project = [] :: term(),
                         proc_id = [] :: list(),
                         created_by = [] :: term(),
                         created = [] :: term(),
                         modified_by = [] :: term(),
                         modified = [] :: term()
}).

-endif.
