-ifndef(BP_REPORT_HRL).
-define(BP_REPORT_HRL, true).

-record(bpReport, { id   = [] :: binary() | list(),
                     from = [] :: binary(),
                     name = [] :: list(),
                     attachments = [] :: list(),
                     percentage = 0 :: float(),
                     duration = [] :: list(),
                     finished = [] :: list(),
                     to = [] :: binary(),
                     familiarizationTime = [] :: [] | calendar:datetime(),
                     comment = [] :: list(),
                     icon = [] :: list(),
                     linked = [] :: list()
                     }).

-endif.