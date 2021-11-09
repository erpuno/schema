-ifndef(COMMONDOC_HRL).
-define(COMMONDOC_HRL, true).

-record(commonDoc, {
  id = [] :: term(),
  date = [] :: [] | calendar:datetime(),
  content = [] :: list(),
  corr = [] :: [] | list(),
  branch = [] :: list(),
  start_time = [] :: [] | calendar:datetime(),
  end_time = [] :: [] | calendar:datetime()
}).

-endif.