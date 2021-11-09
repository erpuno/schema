-ifndef(JOURNALFILTER_HRL).
-define(JOURNALFILTER_HRL, true).

-record(journalFilter, { id = [] :: list(),
                         dateFrom = [] :: term(),
                         dateTo = [] :: term(),
                         type = [] :: binary(),
                         operation = [] :: term(),
                         filterType = [] :: term() }).

-endif.
