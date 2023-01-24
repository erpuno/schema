-ifndef(OUT_ORDER_HRL).
-define(OUT_ORDER_HRL, true).

-include("dict/project.hrl").
-include("dict/person.hrl").
-include("dict/sendInfo.hrl").

% Вихідний лист
% Відповідь на адвокатський запит
% Відповідь на запит народного депутата України
% Відповідь на звернення народного депутата України
% Відповідь на звернення громадян
% Відповідь на запит на публічну інформацію
% 
% Таблица 19 (стр 22, Модель v4.4)


-record(outputOrder, { id= [] :: binary(),
                       guid= [] :: list(),
                       urgent=[] :: [] | boolean(),
                       date=[] :: [] | calendar:datetime(),
                       xml = [] :: [] | binary(),
                       hash = [] :: binary() | list(),
                       signature = [] :: binary() | list(),
                       document_type = [] :: tuple(),
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
                       signatory = [] :: list(#'Person'{}),
                       send_type = [] :: list(),
                       sent = [] :: [] | #sendInfo{},
                       registered_by=[] :: [] | #'Person'{},
                       date_send=[] :: [] | calendar:datetime(),
                       note=[] :: list(),
                       attachments = [] :: list(term()),
                       project = [] :: [] | #project{},
                       seq_id = [] :: list(),
                       created_by = [] :: term(),
                       created = [] :: term(),
                       modified_by = [] :: term(),
                       modified = [] :: term(),
                       template = [] :: term(),
                       assistantProcessed = [],
                       toAttention = []
              }).

-endif.
