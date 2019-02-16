-ifndef(BUYER_HRL).
-define(BUYER_HRL, true).

-record('Buyer',       { id          = [] :: [] | binary(),
                         token       = [] :: [] | binary(),
                         data        = [] :: [] | binary(),
                         type        = [] :: term() }).

-endif.
