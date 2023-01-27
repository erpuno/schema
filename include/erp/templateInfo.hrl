-ifndef(TEMPLATE_INFO).
-define(TEMPLATE_INFO, true).

-record(templateInfo, { id       = [] :: [] | binary(),
                        parent   = [] :: [] | binary() }).

-endif.
