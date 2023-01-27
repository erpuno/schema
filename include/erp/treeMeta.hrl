-ifndef(TREE_META_HRL).
-define(TREE_META_HRL, true).

-record(treeMeta, {
  id       = [] :: list(),
  feed     = [] :: list() | binary(),
  path     = [] :: list() | binary(),
  pattern  = [] :: list() | binary(),
  module   = [] :: list(),
  record   = [] :: term(),
  children = [] :: list(),
  allowCreate = true :: boolean(),
  allowSearch = false :: boolean(),
  createTitle = [] :: binary()
}).

-endif.