-ifndef(TEMPLATE_RULES).
-define(TEMPLATE_RULES, true).

-record(templateReg, {
                       id        = [] :: [] | binary(),
                       name      = [] :: [] | binary(),
                       scalars   = [] :: [] | list(),
                       doc       = [] :: [] | atom(),
                       org       = [] :: [] | binary(),
                       addition  = [] :: [] | list(),
                       fileName  = [] :: [] | binary()
                     }).

-record(templateDoc, {
                       id        = [] :: [] | binary(),
                       name      = [] :: [] | binary(),
                       vars      = [] :: [] | list(),
                       doc       = [] :: [] | binary(),
                       org       = [] :: [] | binary(),
                       filePath  = [] :: [] | binary()
                     }).

-record(templateVar, {
                       id        = [] :: [] | atom(),
                       record    = [] :: [] | tuple(),
                       type      = [] :: [] | atom(),
                       main      = [] :: [] | binary(),
                       tableName = [] :: [] | binary(),
                       tableGuid = [] :: [] | binary(),
                       field     = [] :: [] | list(),
                       value     = [] :: [] | list(),
                       callback  = [] :: [] | list(),
                       options   = [] :: [] | list()
                     }).

-endif.
