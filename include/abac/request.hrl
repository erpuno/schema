-ifndef(REQUEST_HRL).
-define(REQUEST_HRL, true).

-record(request, {
                 type = [] :: [] | atom(),
                 endpoint = [] :: [] | atom(),
                 subject = [] :: [] | term(),
                 context = [] :: [] | term(),
                 resources = [] :: [] | list()
}).

-record(context, {
                form = [] :: [] | tuple(),
                pid  = [] :: [] | list() | binary(),
                process = [] :: [] | tuple(),
                head = [] :: [] | tuple(),
                corr = [] :: [] | tuple(),
                notification = [] :: [] | tuple(),
                stage_status = [] :: [] | tuple(),
                files = [] :: [] | tuple(),
                employee = [] :: [] | tuple(),
                executors = [] :: [] | list(),
                tab = [] :: [] | tuple(),
                report = [] :: [] | tuple(),
                branch = [] :: [] | tuple(),
                search_process = [] :: [] | tuple(),
                search_type = [] :: [] | atom()
}).

-endif.