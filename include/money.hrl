-ifndef(MONEY_HRL).
-define(MONEY_HRL, true).

-type fraction_length() :: integer().
-type digits() :: integer().
-type money() :: {dec,fraction_length(),digits()}.

-endif.
