-ifndef(WMS_HRL).
-define(WMS_HRL, true).

-type unitType() :: unit | weight | capacity.
-type goodType() :: unit | weight | weight_unit | unit_weight.
-type cellType() :: shelf | cell | container | dock | warehouse.
-type dim() :: {integer(),integer(),integer()}.
-type barcode() :: ean13 | code128 | none.
-type orderStatus() :: none | filled | inprocess.
-type itemStatus() :: incart | placed | acquired.

-record('Report', {id,
                   date,
                   cell_in,
                   cell_out,
                   detail}).

-record('Item', {  id = begin timer:sleep(0), kvs:seq([],[]) end,
                   good = [],
                   volume = {dec,0,1},
                   serial = [],
                   price = {dec,0,1},
                   placement = [],
                   status = incart :: itemStatus() }).

-record('Order',  {id = kvs:seq([],[]),
                   type = in :: in | out,
                   no = [],
                   date = os:timestamp(),
                   client :: term(),
                   goods :: list(#'Item'{}),
                   status = none :: orderStatus() }).

% WMS SPEC

-record('Category', {id,
                     name,
                     path}).

-record('Unit', {id,
                 name,
                 type :: unitType(),
                 rate,
                 netto,
                 brutto,
                 dim :: dim()}).

-record('Good', {id = kvs:seq([],[]),
                 name = [],
                 type = unit :: goodType() ,
                 barcode = [],
                 base_qty = 1,
                 base_weight = 1,
                 serial = [],
                 class = none,
                 unit :: #'Unit'{},
                 ext }).

-record('Cell', {id = kvs:seq([],[]),
                 name,
                 type :: cellType(),
                 barcode,
                 zone,
                 parameters,
                 client,
                 categories,
                 max_weight,
                 max_capacity,
                 dim :: dim(),
                 level,
                 priority,
                 class}).

-record('Warehouse',   { id          = [] :: [] | binary(),
                         name        = [] :: [] | binary(),
                         type        = [] :: term() }).

-endif.
