-ifndef(GRANT_INQUIRE_HRL).
-define(GRANT_INQUIRE_HRL, true).

-include_lib("schema/include/erp/catalogs/person.hrl").

-record(inquireGrant, { id= [] :: [] | binary(),
                        typeDoc = [] :: list(),
                        date = [] :: list(),
                        typeUnit = [] :: list(),
                        appraisal  = [] :: list(),
                        regNum = [] :: list(),
                        person = [] :: [] | #'Person'{},
                        birthday = [] :: list(),
                        phone = [] :: [] | list(),
                        passport = [] :: [] | list(),
                        issuedBy = [] :: [] | list(),
                        workplace = [] :: [] | list(),
                        workphone = [] :: [] | list(),
                        motivation = [] :: list(),
                        seq_id = [] :: [] | binary()
                      }).

-endif.
