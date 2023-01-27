-ifndef(SEND_ORDER_HRL).
-define(SEND_ORDER_HRL, true).

-include_lib("schema/include/erp/catalogs/organization.hrl").
-include_lib("schema/include/erp/catalogs/employee.hrl").
-include_lib("schema/include/erp/catalogs/project.hrl").
-include_lib("schema/include/erp/catalogs/dict.hrl").


-record(sendOrder, {id             = [] :: binary(),
                    type           = [] :: list(),
                    date_out       = [] :: [] | calendar:datetime(),
                    corr           = [] :: [] | #'Organization'{},
                    delivery_type  = [] :: [] | #'dict'{},
                    signatory      = [] :: [] | #'Employee'{},
                    content        = [] :: binary(),
                    attachments    = [] :: list(term()),
                    created        = [] :: [] | calendar:datetime(),
                    date_send      = [] :: [] | calendar:datetime(),
                    status         = [] :: [] | #'dict'{},
                    seq_id        = [] :: list(),
                    target         = [] :: [] | #'Employee'{},
                    notify         = [] :: [] | #'Employee'{},
                    executed_by    = [] :: [] | #'Employee'{},
                    registered_by  = [] :: [] | #'Employee'{},
                    sent           = false :: atom(),
                    main_proc      = [] :: binary(),
                    project        = #project{} :: #project{}
                }).

-endif.
