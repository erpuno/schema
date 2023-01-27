-ifndef(FTPSIGNATURE_HRL).
-define(FTPSIGNATURE_HRL, true).

-record(ftpSignature,     { id=[], filename=[], size=[], offset=[], block=[], status=[], signature=[], time=[]}).

-endif.
