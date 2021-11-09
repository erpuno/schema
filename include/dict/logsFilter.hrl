-ifndef(LOGSFILTER_HRL).
-define(LOGSFILTER_HRL, true).

-record(logsFilter, { id = [] :: list(),
                      dateFrom = [] :: term(),
                      dateTo = [] :: term() }).

-endif.
