-ifndef(ESQ_INQUIRE_HRL).
-define(ESQ_INQUIRE_HRL, true).

-include("erp/catalogs/project.hrl").
-include("erp/catalogs/assistantMark.hrl").
-include("erp/catalogs/person.hrl").

-record(esqInquire, { id= [] :: binary(),
                      guid= [] :: list(),
                      urgent=[] :: [] | boolean(),
                      date=[] :: [] | calendar:datetime(),
                      xml = [] :: [] | binary(),
                      hash = [] :: binary() | list(),
                      signature = [] :: binary() | list(),
                      document_type= <<"Адвокатський запит"/utf8>> :: term(),
                      nomenclature=[] :: term(),
                      reject_comment = [] :: binary(),
                      surname=[] :: list(),
                      name=[] :: list(),
                      patronymic=[] :: list(),
                      esq_topic=[] :: list(),
                      category=[] :: [] | list(),
                      number_out=[] :: [] | list(),
                      date_out=[] :: calendar:datetime(),
                      corr=[] :: [] | list(),
                      signed=[] :: [] | list(),
                      koatuu_region=[] :: list(),
                      koatuu_place=[] :: list(),
                      topic = [] :: list(),
                      email = [] :: list(),
                      phone_number = [] :: list(),
                      address=[] :: [] | #'Addr'{},
                      house=[] :: [] | binary(),
                      surname_from=[] :: list(),
                      name_from=[] :: list(),
                      patronymic_from=[] :: list(),
                      dueDate=[] :: [] | calendar:datetime(),
                      form=[] :: [] | term(),
                      to=[] :: [] | #'Person'{},
                      content=[] :: list(),
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
                      lawCertificate = [] :: binary() | list(),
                      authorityOrderNumber = [] :: binary() | list(),
                      bizTask_initiator = [] :: term(),
                      toAttention = #assistantMark{},
                      project = #project{} :: #project{}
 }).

-endif.
