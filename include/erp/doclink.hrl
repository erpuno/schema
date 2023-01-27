-ifndef(DOC_LINK).
-define(DOC_LINK, true).

-record(doclink, {id=[],
                  attachment=[],
                  docnum=[],
                  doctype=[],
                  step=[],
                  proc=[],
                  mon=[],
                  color=[],
                  etc=[],
                  visited=false :: [] | boolean(),
                  star = false :: boolean(),
                  opened = [] :: [] | calendar:datetime(),
                  moved = [] :: [] | calendar:datetime(),
                  mainProcId = [] :: binary(),
                  inputProcId = [] :: binary()}).

-record(doclink_ref, { id = [],
                       folder = [],
                       pid = [],
                       userId = [],
                       user = [],
                       type = [],
                       feed = [],
                       permanent = [],
                       folderPrefix = [],
                       reject = []}).

-endif.
