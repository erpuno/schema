-ifndef(SELLER_HRL).
-define(SELLER_HRL, true).

-record('Seller',       {id          = [] :: [] | binary(),
                         token       = [] :: [] | binary(),
                         data        = [] :: [] | binary(),
                         type        = [] :: term() }).

-endif.
