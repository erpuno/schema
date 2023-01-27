-ifndef(NOTIFICATION_HRL).
-define(NOTIFICATION_HRL, true).

-include_lib("schema/include/erp/catalogs/employee.hrl").

-record('notification', { id               = [] :: list(),
                          type             = [] :: binary(),
                          delivery         = [] :: binary(),
                          content          = [] :: binary(),
                          users            = [] :: binary() | list(),
                          user_roles       = [] :: list(),
                          attachments      = false :: root | boolean()
                        }).

-record('userNotification', { id       = [] :: list(),
                              type     = [] :: binary(),
                              user     = [] :: #'Employee'{},
                              created  = [] :: calendar:datetime(),
                              proc_id  = [] :: binary(),
                              mon_id   = [] :: binary(),
                              doc_name = [] :: binary(),
                              content  = [] :: binary(),
                              attachments = [] :: list()
                            }).

-endif.