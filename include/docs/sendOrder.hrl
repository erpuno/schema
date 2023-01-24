-ifndef(SEND_ORDER_HRL).
-define(SEND_ORDER_HRL, true).

-include("erp/catalogs/organization.hrl").
-include("erp/catalogs/employee.hrl").
-include("erp/catalogs/project.hrl").
-include("erp/catalogs/dict.hrl").


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
