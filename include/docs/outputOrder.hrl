-ifndef(OUT_ORDER_HRL).
-define(OUT_ORDER_HRL, true).

-include("dict/person.hrl").

% Вихідний лист
% Відповідь на адвокатський запит
% Відповідь на запит народного депутата України
% Відповідь на звернення народного депутата України
% Відповідь на звернення громадян
% Відповідь на запит на публічну інформацію

-record(outputOrder, { id= [] :: binary(),
                       guid= [] :: list(),
                       urgent=[] :: [] | boolean(),
                       date=[] :: [] | calendar:datetime(),
                       xml = [] :: [] | binary(),
                       hash = [] :: binary() | list(),
                       signature = [] :: binary() | list(),
                       document_type= <<"Вихідний документ"/utf8>> :: term(),
                       nomenclature=[] :: term(),
                       purpose=[] :: [] | list(),
                       purpose_sev=[] :: [] | list(),
                       corr=[] :: [] | list(),
                       deputy=[] :: [] | list(),
                       sign=[] :: [] | list(),
                       executor = [] :: [] | #'Person'{},
                       branch = [] :: list(),
                       head = [] :: [] | #'Person'{},
                       content= [] :: list(),
                       approvers = [] :: list(#'Person'{}),
                       signed = [] :: list(#'Person'{}),
                       send_type = [] :: list(),
                       sent = no :: yes | no,
                       registered_by=[] :: [] | #'Person'{},
                       date_send=[] :: [] | calendar:datetime(),
                       note=[] :: list(),
                       attachments = [] :: list(term()),
                       project = [] :: term(),
                       proc_id = [] :: list(),
                       created_by = [] :: term(),
                       created = [] :: term(),
                       modified_by = [] :: term(),
                       modified = [] :: term(),
                       template = [] :: term()
              }).

-endif.
