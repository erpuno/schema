-ifndef(MAIL_DOC_HRL).
-define(MAIL_DOC_HRL, true).

-include("dict/person.hrl").

-record(mailDoc,{ id            = [] :: binary()
                , from          = [] :: [] | #'Person'{}
                , to            = [] :: [] | list(#'Person'{})
                , content       = [] :: [] | list()
                , attachments   = [] :: list(term())
                , document_type = <<"Лист"/utf8>> :: term()
                , date          = [] :: [] | calendar:datetime()
                , proc_id       = [] :: list()
                , executor      = [] :: [] | #'Person'{}
                , registered_by = [] :: [] | #'Person'{}
                }).

-endif.
