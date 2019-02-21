-ifndef(SELLER_HRL).
-define(SELLER_HRL, true).

-record('Seller',       {id          = [] :: [] | binary(),
                         prev        = [] :: [] | binary(),
                         next        = [] :: [] | binary(),
                         token       = [] :: [] | binary(),
                         data        = [] :: [] | binary(),
                         type        = [] :: term() }).

-endif.
