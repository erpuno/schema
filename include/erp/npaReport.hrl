-ifndef(NPA_REPORT).
-define(NPA_REPORT, true).

-record(npaReport, {
    name = [],
    register = [],
    begin_date = [],
    agree = [],
    agree_date = [],
    num = [],
    guid = [],
    skip2 = false,
    content = [],
    exp_date = [],
    exp_term_date = [],
    exp_conclusion_date = [],
    register_num = [],
    register_date = [] }).

-endif.
