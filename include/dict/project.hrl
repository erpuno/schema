-ifndef(PROJECT_HRL).
-define(PROJECT_HRL, true).

-record(project, { approvers = [] :: [] | term(),
                   signer = [] :: binary() | list(),
                   comment = [] :: binary() | list(),
                   creator = [] :: binary() | list(),
                   executors = [] :: [] | term(),
                   control = [] :: [] | list(),
                   notified = [] :: [] | list(),
                   familiarized = [] :: [] | list(),
                   certifier = [] :: [] | list(),
                   sentOrgs = [] :: [] | list(),
                   sentOutput = [] :: [] | list()
                  }).

-record(projectUser, { id = [] :: [] | binary(),
                       user = [] :: [] | tuple(),
                       delegate = [] :: [] | tuple(),
                       assistant = [] :: [] | tuple(),
                       time = [] :: [] | tuple(),
                       signature = [] :: [] | binary(),
                       org = [] :: [] | tuple(),
                       outputUser = [] :: [] | tuple(),
                       comment = [] :: [] | list()
                     }).

-endif.
