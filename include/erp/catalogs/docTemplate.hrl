-ifndef(DOCTEMPLATE).
-define(DOCTEMPLATE, true).

-record(docTemplate, {
        id = [] :: [] |binary(),
        name = [] :: [] | binary(),
        doc = [] :: [] | tuple(),
        module = [] :: [] | atom()
     }).

-endif.