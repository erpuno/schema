-ifndef(EMAIL_DOC_HRL).
-define(EMAIL_DOC_HRL, true).

-include("dict/person.hrl").
-include("dict/orgEmail.hrl").

-record(emailReceiver, {  id            = []    :: binary(),
                          employee      = []    :: [] | #'Person'{},
                          email         = []    :: [] | binary()
}).

-record(emailDoc, { id             = []    :: binary(),
                    guid           = []    :: list(),
                    from           = []    :: [] | #orgEmail{} | list(),
                    to             = []    :: [] | list(#emailReceiver{}) | #orgEmail{},
                    subject        = []    :: [] | list(),
                    content        = []    :: [] | list(),
                    attachments    = []    :: list(term()),
                    created        = []    :: [] | calendar:datetime(),
                    date_send      = []    :: [] | calendar:datetime(),
                    sent           = false :: atom(),
                    received       = false :: atom(),
                    accepted       = false :: atom(),
                    proc_id        = []    :: list(),
                    created_by     = []    :: [] | #'Person'{},
                    registered_by  = []    :: [] | #'Person'{},
                    email_type     = []    :: term(),
                    reject_comment = []    :: binary()
                }).

-endif.
