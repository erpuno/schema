-ifndef(SENDINFO_HRL).
-define(SENDINFO_HRL, true).

-record(sendInfo, { orgs = [] :: [] | term(),
                    etc  =  [] :: [] | term()
              }).

-endif.
