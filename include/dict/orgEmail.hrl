-ifndef(ORGEMAIL_HRL).
-define(ORGEMAIL_HRL, true).

-record(orgEmail, { id           = kvs:seq([],[]) :: term(),
                    name         = []  :: binary(),
                    
                    relaySmtp    = []  :: binary(),
                    loginSmtp    = []  :: binary(),
                    passwordSmtp = []  :: binary(),
                    portSmtp     = []  :: integer(),
                    sslSmtp      = []  :: boolean(),

                    relayPop3    = []  :: binary(),
                    portPop3     = []  :: integer(),
                    sslPop3      = []  :: boolean(),

                    email        = []  :: []  | binary(),
                    password     = []  :: []  | binary()
                  }).

-endif.
