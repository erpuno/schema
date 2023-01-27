-ifndef(ASSISTANTMARK_HRL).
-define(ASSISTANTMARK_HRL, true).

-include("erp/access.hrl").

-record('assistantMark', { id = [] :: list(),
                           status = [] :: atom(),
                           assistant = [] :: #assistant{}}).

-endif.