-ifndef(CITIZEN_INQUIRE_HRL).
-define(CITIZEN_INQUIRE_HRL, true).

-include("erp/catalogs/project.hrl").
-include("erp/catalogs/assistantMark.hrl").
-include("erp/catalogs/person.hrl").
-include("erp/catalogs/location.hrl").
-include("erp/catalogs/inquire.hrl").
-include("erp/catalogs/address.hrl").

-record(citizenInquire, { id= [] :: binary(),
                          guid= [] :: list(),
                          date=[] :: [] | calendar:datetime(),
                          urgent=[] :: [] | boolean(),
                          xml = [] :: [] | binary(),
                          hash = [] :: binary() | list(),
                          signature = [] :: binary() | list(),
                          reject_comment = [] :: binary(),
                          document_type= <<"Запит, звернення громадянина"/utf8>> :: term(),
                          nomenclature=[] :: term(),
                          surname=[] :: list(),
                          name=[] :: list(),
                          patronymic=[] :: list(),
                          gender=[] :: list(),
                          email=[] :: list(),
                          phone_number=[] :: list(),
                          subject=[] :: list(),
                          subject_count=[] :: [] | list(),
                          author_type=[] :: [] | list(),
                          social_status= [] :: list(),
                          koatuu_region=[] :: list(),
                          koatuu_place=[] :: list(),
                          address=[] :: [] | #'Addr'{},
                          house=[] :: [] | binary(),
                          content=[] :: list(),
                          issue=[] :: list(),
                          note=[] :: list(),
                          issue_type=[] :: list(),
                          issue_specie=[] :: list(),
                          form=[] :: list(),
                          averment=[] :: list(),
                          from=[] :: [] | #'Person'{} | #'Organization'{},
                          number_out=[] :: list(),
                          date_out=[] :: [] | calendar:datetime(),
                          executor=[] :: [] | #'Person'{},
                          to=[] :: [] | #'Person'{},
                          dueDate=[] :: [] | calendar:datetime(),
                          result=[] :: [] | list(),
                          main_sheets=[] :: [] | list(),
                          add_sheets=[] :: [] | list(),
                          registered_by=[] :: [] | #'Person'{},
                          topic=[] :: [] | list(),
                          coordination=[] :: list(),
                          attachments = [] :: list(term()),
                          seq_id = [] :: list(),
                          created_by = [] :: term(),
                          created = [] :: term(),
                          modified_by = [] :: term(),
                          modified = [] :: term(),
                          bizTask_initiator = [] :: term(),
                          toAttention = #assistantMark{},
                          project = #project{} :: #project{}
  }).

-endif.
