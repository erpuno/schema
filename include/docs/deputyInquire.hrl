-ifndef(DEPUTY_INQUIRE_HRL).
-define(DEPUTY_INQUIRE_HRL, true).

-include("dict/person.hrl").
-include("dict/location.hrl").
-include("dict/address.hrl").

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
                         signed=[] :: [] | list(),
                         number_out=[] :: [] | list(),
                         date_out=[] :: calendar:datetime(),
                         request=[] :: [] | list(),
                         committee=[] :: [] | list(),
                         deputy=[] :: [] | list(),
                         id_ndu=[] :: [] | list(),
                         date_ndu=[] :: [] | calendar:datetime(),
                         address_ndu=[] :: [] | #'Address'{},
                         content= [] :: list(),
                         topic=[] :: list(),
                         category=[] :: [] | list(),
                         corr_from=[] :: [] | list(),
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
                         to_attention=[] :: [] | list(),
                         coordination=[] :: list(),
                         attachments = [] :: list(term()),
                         proc_id = [] :: list(),
                         created_by = [] :: term(),
                         created = [] :: term(),
                         modified_by = [] :: term(),
                         modified = [] :: term()
 }).

-endif.
