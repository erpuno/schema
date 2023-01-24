-ifndef(GRANT_PERMISSION_HRL).
-define(GRANT_PERMISSION_HRL, true).

-include("erp/catalogs/person.hrl").

-record(grantPermission, {
    id= [] :: binary(),
    regNum = [] :: [] | list(),
    regDate = [] :: [] | list(),
    expire = [] :: [] | list(),
    typeUnit = [] :: list(),         % из заявки
    appraisal  = [] :: list(),       % из заявки
    person = [] :: [] | #'Person'{}, % из заявки
    issuedBy = [] :: [],
    seq_id = [] :: [] | binary()}).

-record(grantPermissionPOA, {
    id= [] :: binary(),
    regNum = [] :: [] | list(),
    regDate = [] :: [] | list(),
    expire = [] :: [] | list(),
    typeUnit = [] :: list(),
    appraisal  = [] :: list(),
    person = [] :: [] | #'Person'{},
    issuedBy = [] :: [],
    on_behalf = [] :: [] | #'Person'{},
    seq_id = [] :: [] | binary()}).

-record(grantUnit, { id= [] :: [] | binary(),
                     serial = [] :: list(),
                     manufactured = [] :: list(),
                     manufacturer = [] :: list(),
                     typeUnit = [] :: list(),
                     model = [] :: list(),
                     caliber = [] :: list(),
                     warehouse = [] :: list(),
                     authority = [] :: list(),
                     seq_id = [] :: [] | binary()
                    }).

-endif.
