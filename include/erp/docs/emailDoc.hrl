-ifndef(EMAIL_DOC_HRL).
-define(EMAIL_DOC_HRL, true).

-include("erp/catalogs/person.hrl").
-include("erp/catalogs/orgEmail.hrl").
-include("erp/catalogs/project.hrl").

-record(emailReceiver, {  id            = []    :: binary(),
                          corr          = []    :: [] | #'Person'{}
}).

-record(sendEmailDoc, {
                    id             = []    :: binary(),
                    guid           = []    :: list(),
                    from           = []    :: [] | #orgEmail{} | list(),
                    to             = []    :: [] | list(#emailReceiver{}) | #orgEmail{},
                    subject        = []    :: [] | list(),
                    content        = []    :: [] | list(),
                    attachments    = []    :: list(term()),
                    created        = []    :: [] | calendar:datetime(),
                    date_send      = []    :: [] | calendar:datetime(),
                    sent           = false :: atom(),
                    seq_id        = []    :: list(),
                    created_by     = []    :: [] | #'Person'{},
                    registered_by  = []    :: [] | #'Person'{},
                    email_type     = []    :: term(),
                    project = #project{} :: #project{}
                }).

-record(receiveEmailDoc, {
            id             = []    :: binary(),
            guid           = []    :: list(),
            from           = []    :: [] | #orgEmail{} | list(),
            to             = []    :: [] | list(#emailReceiver{}) | #orgEmail{},
            subject        = []    :: [] | list(),
            content        = []    :: [] | list(),
            attachments    = []    :: list(term()),
            created        = []    :: [] | calendar:datetime(),
            accepted       = false :: atom(),
            seq_id        = []    :: list(),
            registered_by  = []    :: [] | #'Person'{},
            email_type     = []    :: term(),
            project = #project{} :: #project{}
            }).

-endif.
