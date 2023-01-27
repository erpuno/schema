-ifndef(REPORT).
-define(REPORT, true).

-record(report, {
        id = [] :: binary(),
        report_type = [] :: atom(),
        type = [] :: atom(),
        docId = [] :: binary(),
        seq_id = [] :: list() | binary(),
        docType = [] :: atom(),
        pid = [] :: binary(),
        subPid = [] :: binary(),
        corr = [] :: tuple(),
        branch = [] :: tuple() | binary(),
        branches = [] :: list(),
        position = [] :: tuple() | binary(),
        date = [] :: tuple() | binary(),
        user = [] :: tuple() | binary(),
        signatory = [] :: binary(),
        executor =  [] :: tuple(),
        issue = [] :: tuple() | binary(),
        issue_type = [] :: tuple() | binary(),
        dueDate = [] :: tuple(),
        executedDate = [] :: tuple(),
        number_out = [] :: binary(),
        averment = [] :: tuple() | binary(),
        content = [] :: binary(),
        resolutionContent = [] :: binary(),
        mainResolutionContent = [] :: binary(),
        name = [] :: binary(),
        surname = [] :: binary(),
        patronymic = [] :: binary(),
        count = 0 :: integer(),
        countSheets = 0 :: integer()
     }).

-record(reportIndex, {
        id = [] :: binary(),
        name = [] :: binary() | list(),
        feeds = [] :: list(),
        sheets = 0 :: integer()
      }).

-record(reportCriteria, {
        id = [] :: binary(),
        type = [] :: tuple(),
        dateFrom = [] :: tuple(),
        dateTo = [] :: tuple(),
        created = [] :: tuple(),
        branch = [] :: tuple(),
        user = [] :: tuple(),
        attachments = [] :: tuple()
      }).

-record(reportRow, {
        number = [] :: integer(), 
        info = [] :: binary() | tuple(),
        counters = [] :: list()
      }).

-endif.
