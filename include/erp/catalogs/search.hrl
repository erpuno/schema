-ifndef(SEARCH_HRL).
-define(SEARCH_HRL, true).

-type ffeed() :: fun((term()) -> binary()).

-record('searchTmpl', { id = kvs:seq([],[]) :: [] | binary() | list(),
                        name = []           :: [] | list() | binary(),
                        feed = []           :: [] | list() | binary(),
                        level = 1           :: integer(),
                        search_feed = []    :: [] | ffeed(),
                        doc = []            :: [] | list() }).

-endif.