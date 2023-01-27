-ifndef(CHATMESSAGE_HRL).
-define(CHATMESSAGE_HRL, true).

-record('chatMessage', { 
                id      = kvs:seq([],[]),
                user    = [] :: [] | #'Employee'{},
                body    = [] :: [] | binary(),
                monitor = [] :: [] | list(),
                proc_id = [] :: [] | list(),
                sent    = [] :: [] | calendar:datetime(),
                options = [] :: [] | list()}).

-endif.