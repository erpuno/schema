-ifndef(REJECTCOMMENT_HRL).
-define(REJECTCOMMENT_HRL, true).

-record(rejectComment, { user = [] :: [] | term(),
                         comment = [] :: binary() | list(),
                         needReject = false :: boolean()
                       }).

-endif.
