-ifndef(SIGN).
-define(SIGN, true).

-record(sign, {
     guid = [] :: binary(),
     pid = [] :: binary(),
     fileName = [] :: binary(),
     docId = [] :: binary(),
     action = [] :: atom(),
     status = [] :: atom(),
     length = 0 :: integer(),
     signature = [] :: binary(),
     time = [] :: tuple(),
     offset = 0 :: integer(),
     size = [] :: integer(),
     tab = [] :: binary(),
     retryCount = 0 :: integer(),
     certificate = [] :: [] | tuple()
     }).

-endif.
