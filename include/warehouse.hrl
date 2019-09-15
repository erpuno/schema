-ifndef(WMS_HRL).
-define(WMS_HRL, true).

-type unitType() :: unit | weight | capacity.
-type productType() :: unit | weight | weight_unit | unit_weight.
-type cellType() :: shelf | cell | container | dock | warehouse.
-type dim() :: {integer(),integer(),integer()}.
-type barcode() :: ean13 | code128 | [].

-record('Report', {id,
                   date,
                   cell_in,
                   cell_out,
                   detail}).

-record('Item', {  id,
                   good,
                   volume,
                   serial,
                   price,
                   placement}).

-record('Order',  {id = begin kvs:seq([],[]), timer:sleep(1) end,
                   type = in :: in | out,
                   no,
                   date,
                   client :: term(),
                   goods :: list(#'Item'{})}).

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
                 type = unit :: productType() ,
                 barcode = [],
                 base_qty = 1,
                 base_weight = 1,
                 serial = [],
                 class = none,
                 unit :: #'Unit'{},
                 ext }).

-record('Cell', {id = begin kvs:seq([],[]), timer:sleep(1) end,
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
