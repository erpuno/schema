-ifndef(COMMONDOC_HRL).
-define(COMMONDOC_HRL, true).

-record(commonDoc, {
  id = [] :: term(),
  seq_id = [] :: [] | binary(),
  document_atom = [] :: [] | atom(),
  date = [] :: [] | calendar:datetime(),
  nomenclature = [] :: term(),
  content = [] :: list(),
  corr = [] :: [] | list(),
  branch = [] :: list(),
  start_time = [] :: [] | calendar:datetime(),
  end_time = [] :: [] | calendar:datetime()
}).

-endif.