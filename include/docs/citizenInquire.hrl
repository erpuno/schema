-ifndef(CITIZEN_INQUIRE_HRL).
-define(CITIZEN_INQUIRE_HRL, true).

-include("dict/person.hrl").
-include("dict/location.hrl").
-include("dict/inquire.hrl").
-include("dict/address.hrl").

-record(citizenInquire, { id= [] :: binary(),
                          guid= [] :: list(),
                          date=[] :: [] | calendar:datetime(),
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
                          address=[] :: [] | #'Address'{},
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
