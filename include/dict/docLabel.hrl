-ifndef(DOC_LABEL_HRL).
-define(DOC_LABEL_HRL, true).

-record('docLabel', { id = [] :: binary(),
                   color = <<"#777777"/utf8>> :: binary(),
                   secondary = <<"#FFFFFF"/utf8>> :: binary(),
                   icon = <<"label-general"/utf8>> :: binary()}).

-endif.