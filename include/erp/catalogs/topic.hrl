-ifndef(TOPIC_HRL).
-define(TOPIC_HRL, true).

-record('topic', { id = [] :: list(),
                   value = [] :: binary(),
                   users = [] :: list()}).

-endif.