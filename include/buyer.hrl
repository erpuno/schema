-ifndef(BUYER_HRL).
-define(BUYER_HRL, true).

-record('Buyer',       { id          = [] :: [] | binary(),
                         prev        = [] :: [] | binary(),
                         next        = [] :: [] | binary(),
                         token       = [] :: [] | binary(),
                         data        = [] :: [] | binary(),
                         type        = [] :: term() }).

-endif.
