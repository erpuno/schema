-ifndef(DEPUTY_INQUIRE_HRL).
-define(DEPUTY_INQUIRE_HRL, true).

-include("erp/catalogs/project.hrl").
-include("erp/catalogs/assistantMark.hrl").
-include("erp/catalogs/person.hrl").
-include("erp/catalogs/location.hrl").
-include("erp/catalogs/address.hrl").

-record(deputyInquire, { id= [] :: binary(),
                         guid= [] :: list(),
                         urgent=[] :: [] | boolean(),
                         number=[] :: list(),
                         date=[] :: [] | calendar:datetime(),
                         xml = [] :: [] | binary(),
                         hash = [] :: binary() | list(),
                         signature = [] :: binary() | list(),
                         reject_comment = [] :: binary(),
                         document_type=  {dict, '31', 'type', <<"Запит"/utf8>>} :: term(),
                         nomenclature=[] :: term(),
                         type=[] :: inquire | request | term(),
                         corr=[] :: [] | list(),
                         number_out=[] :: [] | list(),
                         date_out=[] :: calendar:datetime(),
                         signed=[] :: [] | list(),
                         request=[] :: [] | list(),
                         committee=[] :: [] | list(),
                         deputy=[] :: [] | list(),
                         id_ndu=[] :: [] | list(),
                         date_ndu=[] :: [] | calendar:datetime(),
                         address_ndu=[] :: [] | #'Addr'{},
                         house_ndu=[] :: [] | binary(),
                         house=[] :: [] | binary(),
                         content= [] :: list(),
                         topic=[] :: list(),
                         category=[] :: [] | list(),
                         corr_from=[] :: [] | list(),
                         number_from=[] :: [] | list(),
                         date_from=[] :: calendar:datetime(),
                         signed_from=[] :: [] | list(),
                         surname=[] :: list(),
                         name=[] :: list(),
                         patronymic=[] :: list(),
                         email = [] :: list(),
                         phone_number = [] :: list(),
                         koatuu_region=[] :: list(),
                         koatuu_place=[] :: list(),
                         address=[] :: [] | #'Address'{},
                         from=[] :: [] | #'Person'{},
                         dueDate=[] :: [] | calendar:datetime(),
                         to=[] :: [] | #'Person'{},
                         note=[] :: list(),
                         main_sheets=[] :: [] | list(),
                         add_sheets=[] :: [] | list(),
                         registered_by=[] :: [] | #'Person'{},
                         coordination=[] :: list(),
                         attachments = [] :: list(term()),
                         seq_id = [] :: list(),
                         created_by = [] :: term(),
                         created = [] :: term(),
                         modified_by = [] :: term(),
                         modified = [] :: term(),
                         deputy_topic=[] :: list(),
                         bizTask_initiator = [] :: term(),
                         toAttention = #assistantMark{},
                         project = #project{} :: #project{}
 }).

-endif.
