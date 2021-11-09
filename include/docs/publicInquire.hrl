-ifndef(PUBLIC_INQUIRE_HRL).
-define(PUBLIC_INQUIRE_HRL, true).

-include("dict/person.hrl").
-include("dict/location.hrl").
-include("dict/inquire.hrl").

-record(publicInquire, {  id= [] :: binary(),
                          guid= [] :: list(),
                          date=[] :: [] | calendar:datetime(),
                          xml = [] :: [] | binary(),
                          hash = [] :: binary() | list(),
                          signature = [] :: binary() | list(),
                          document_type= <<"Запит на публічну інформацію"/utf8>> :: term(),
                          reject_comment = [] :: binary(),
                          nomenclature=[] :: term(),
                          subject = [] :: list(),
                          subject_number=[] :: [] | list(),
                          subjects=[] :: [] | list(),
                          author_type=[] :: [] | list(),
                          social_status= [] :: list(),
                          surname=[] :: list(),
                          name=[] :: list(),
                          patronymic=[] :: list(),
                          gender=[] :: list(),
                          category=[] :: [] | list(),
                          corr=[] :: [] | list(),
                          signed_by=[] :: [] | list(),
                          email=[] :: list(),
                          phone_number=[] :: list(),
                          koatuu_region=[] :: list(),
                          koatuu_place=[] :: list(),
                          address=[] :: [] | #'Address'{},
                          content=[] :: list(),
                          issue=[] :: list(),
                          issue_type = [] :: list(),
                          form = [] :: list(),
                          averment = [] :: list(),
                          from=[] :: [] | #'Person'{} | #'Organization'{},
                          number_out = [] :: list(),
                          date_out=[] :: [] | calendar:datetime(),
                          to=[] :: [] | #'Person'{} | #'Organization'{},
                          dueDate=[] :: [] | calendar:datetime(),
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
                          modified = [] :: term(),
                          note = [] :: list()
             }).

-endif.
