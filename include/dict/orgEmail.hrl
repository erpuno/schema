-ifndef(ORGEMAIL_HRL).
-define(ORGEMAIL_HRL, true).

-record(orgEmail, { id            = kvs:seq([],[]) :: term(),
                    name          = []  :: binary(),
                    relaySmtp     = []  :: binary(),
                    loginSmtp    = []  :: binary(),
                    passwordSmtp = []  :: binary(),
                    portSmtp      = []  :: integer(),
                    relayPop3    = []  :: binary(),
                    portPop3      = []  :: integer(),
                    email         = []  :: []  | binary(),
                    password      = []  :: []  | binary()
                  }).

-endif.
