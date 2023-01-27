-module(erp).
-compile(export_all).
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("schema/include/erp/access.hrl").
-include_lib("schema/include/erp/npaReport.hrl").
-include_lib("schema/include/erp/credentials.hrl").
-include_lib("schema/include/erp/templateReg.hrl").
-include_lib("schema/include/erp/sign.hrl").
-include_lib("schema/include/erp/docs/petition.hrl").
-include_lib("schema/include/erp/docs/courtOrder.hrl").
-include_lib("schema/include/erp/docs/crimeInquire.hrl").
-include_lib("schema/include/erp/catalogs/crimes.hrl").
-include_lib("schema/include/erp/catalogs/crimesParty.hrl").
-include_lib("schema/include/erp/docs/crimeInquire.hrl").
-include_lib("schema/include/erp/catalogs/sign.hrl").
-include_lib("schema/include/erp/catalogs/crmRole.hrl").
-include_lib("schema/include/erp/catalogs/address.hrl").
-include_lib("schema/include/erp/catalogs/assistantMark.hrl").
-include_lib("schema/include/erp/catalogs/location.hrl").
-include_lib("schema/include/erp/catalogs/koatuu.hrl").
-include_lib("schema/include/erp/catalogs/dict.hrl").
-include_lib("schema/include/erp/catalogs/topic.hrl").
-include_lib("schema/include/erp/catalogs/userGroup.hrl").
-include_lib("schema/include/erp/catalogs/docLabel.hrl").
-include_lib("schema/include/erp/catalogs/holiday.hrl").
-include_lib("schema/include/erp/catalogs/deedCat.hrl").
-include_lib("schema/include/erp/catalogs/journalFilter.hrl").
-include_lib("schema/include/erp/catalogs/logsFilter.hrl").
-include_lib("schema/include/erp/catalogs/organization.hrl").
-include_lib("schema/include/erp/catalogs/rejectComment.hrl").
-include_lib("schema/include/erp/catalogs/sendInfo.hrl").
-include_lib("schema/include/erp/docs/bizTask.hrl").
-include_lib("schema/include/erp/docs/autoTask.hrl").
-include_lib("schema/include/erp/docs/notifyTask.hrl").
-include_lib("schema/include/erp/docs/controlTask.hrl").
-include_lib("schema/include/erp/docs/citizenInquire.hrl").
-include_lib("schema/include/erp/docs/deputyInquire.hrl").
-include_lib("schema/include/erp/docs/esqInquire.hrl").
-include_lib("schema/include/erp/docs/adminService.hrl").
-include_lib("schema/include/erp/docs/inputOrder.hrl").
-include_lib("schema/include/erp/docs/internalDoc.hrl").
-include_lib("schema/include/erp/docs/orgDoc.hrl").
-include_lib("schema/include/erp/docs/outputOrder.hrl").
-include_lib("schema/include/erp/docs/sevDoc.hrl").
-include_lib("schema/include/erp/docs/publicInquire.hrl").
-include_lib("schema/include/erp/docs/emailDoc.hrl").
-include_lib("schema/include/erp/docs/sendOrder.hrl").
-include_lib("schema/include/erp/catalogs/search.hrl").
-include_lib("schema/include/erp/doclink.hrl").
-include_lib("schema/include/erp/constructor.hrl").
-include_lib("schema/include/erp/docs/commonDoc.hrl").
-include_lib("schema/include/erp/docs/grantInquire.hrl").
-include_lib("schema/include/erp/docs/grantPermission.hrl").
-include_lib("schema/include/erp/catalogs/branch.hrl").
-include_lib("schema/include/erp/catalogs/position.hrl").
-include_lib("schema/include/erp/catalogs/person.hrl").
-include_lib("schema/include/erp/catalogs/employee.hrl").
-include_lib("schema/include/erp/catalogs/deputy.hrl").
-include_lib("schema/include/erp/catalogs/userRole.hrl").
-include_lib("schema/include/erp/catalogs/chatMessage.hrl").
-include_lib("schema/include/erp/catalogs/orgEmail.hrl").
-include_lib("schema/include/erp/catalogs/fileDesc.hrl").
-include_lib("schema/include/erp/catalogs/tabInfo.hrl").
-include_lib("schema/include/erp/catalogs/project.hrl").
-include_lib("schema/include/erp/catalogs/certificate.hrl").
-include_lib("schema/include/erp/catalogs/docTemplate.hrl").

-include_lib("schema/include/abac/abac.hrl").
-include_lib("schema/include/abac/objects.hrl").
-include_lib("schema/include/abac/request.hrl").
-include_lib("schema/include/abac/subjects.hrl").

-include_lib("form/include/formReg.hrl").
-include_lib("bpe/include/bpe.hrl").
-include_lib("form/include/meta.hrl").
-include("erp/catalogs/branch.hrl").
-include("erp/catalogs/person.hrl").
-include("erp/access.hrl").
-include("erp/procChild.hrl").
-include("erp/report.hrl").
-include("erp/urgentLink.hrl").


-behaviour(application).
-behaviour(supervisor).
-compile(export_all).
-export([start/2, stop/1, init/1, atoms/0]).

replace(S,A,B) -> re:replace(S,A,B,[global,{return,list}]).

metainfo() -> #schema { name = crm,  tables = tables() }.
tables() -> [
              #table  { name = bizTask, fields = record_info(fields, bizTask), instance = #bizTask{} },
              #table  { name = autoTask, fields = record_info(fields, autoTask), instance = #autoTask{} },
              #table  { name = notifyTask, fields = record_info(fields, notifyTask), instance = #notifyTask{} },
              #table  { name = controlTask, fields = record_info(fields, controlTask), instance = #controlTask{} },
              #table  { name = sevApprover, fields = record_info(fields, sevApprover), instance = #sevApprover{} },
              #table  { name = sevTask, fields = record_info(fields, sevTask), instance = #sevTask{} },
              #table  { name = sevRef, fields = record_info(fields, sevRef), instance = #sevRef{} },
              #table  { name = citizenInquire, fields = record_info(fields, citizenInquire), instance = #citizenInquire{} },
              #table  { name = deputyInquire, fields = record_info(fields, deputyInquire), instance = #deputyInquire{} },
              #table  { name = esqInquire, fields = record_info(fields, esqInquire), instance = #esqInquire{} },
              #table  { name = adminService, fields = record_info(fields, adminService), instance = #adminService{} },
              #table  { name = inputOrder, fields = record_info(fields, inputOrder), instance = #inputOrder{} },
              #table  { name = orgDoc, fields = record_info(fields, orgDoc), instance = #orgDoc{} },
              #table  { name = internalDoc, fields = record_info(fields, internalDoc), instance = #internalDoc{} },
              #table  { name = outputOrder, fields = record_info(fields, outputOrder), instance = #outputOrder{} },
              #table  { name = sendSevDoc, fields = record_info(fields, sendSevDoc), instance = #sendSevDoc{}  },
              #table  { name = receiveSevDoc, fields = record_info(fields, receiveSevDoc), instance = #receiveSevDoc{}  },
              #table  { name = npaReport, fields = record_info(fields, npaReport), instance = #npaReport{}  },
              #table  { name = dict, fields = record_info(fields, dict), instance = #dict{} },
              #table  { name = topic, fields = record_info(fields, topic), instance = #topic{} },
              #table  { name = userGroup, fields = record_info(fields, userGroup), instance = #userGroup{} },
              #table  { name = docLabel, fields = record_info(fields, docLabel), instance = #docLabel{} },
              #table  { name = writer, fields = record_info(fields, writer), instance = #writer{} },
              #table  { name = holiday, fields = record_info(fields, holiday), instance = #holiday{} },
              #table  { name = formReg, fields = record_info(fields, formReg), instance = #formReg{} },
              #table  { name = deedCat, fields = record_info(fields, deedCat), instance = #deedCat{} },
              #table  { name = publicInquire, fields = record_info(fields, publicInquire), instance = #publicInquire{} },
              #table  { name = templateReg, fields = record_info(fields, templateReg), instance = #templateReg{} },
              #table  { name = credentials, fields = record_info(fields, credentials), instance = #credentials{} },
              #table  { name = signature, fields = record_info(fields, signature), instance = #signature{} },
              #table  { name = rightsDelegation, fields = record_info(fields, rightsDelegation), instance = #rightsDelegation{} },
              #table  { name = assistant, fields = record_info(fields, assistant), instance = #assistant{} },
              #table  { name = searchTmpl, fields = record_info(fields, searchTmpl), instance = #searchTmpl{} },
              #table  { name = crmRole, fields = record_info(fields, crmRole), instance = #crmRole{} },
              #table  { name = locality, fields = record_info(fields, locality), instance = #locality{} },
              #table  { name = 'Organization', fields = record_info(fields, 'Organization'), instance = #'Organization'{}},
              #table  { name = 'Position', fields = record_info(fields, 'Position'), instance = #'Position'{} },
              #table  { name = 'Branch', fields = record_info(fields, 'Branch'), instance = #'Branch'{} },
              #table  { name = 'Person', fields = record_info(fields, 'Person'), instance = #'Person'{} },
              #table  { name = 'Employee', fields = record_info(fields, 'Employee'), instance = #'Employee'{} },
              #table  { name = 'Deputy', fields = record_info(fields, 'Deputy'), instance = #'Deputy'{} },
              #table  { name = 'Address', fields = record_info(fields, 'Address'), instance = #'Address'{} },
              #table  { name = 'Addr', fields = record_info(fields, 'Addr'), instance = #'Addr'{} },
              #table  { name = 'Loc', fields = record_info(fields, 'Loc'), instance = #'Loc'{} },
              #table  { name = bpeActivity, fields = record_info(fields, bpeActivity), instance = #bpeActivity{} },
              #table  { name = bpeProc, fields = record_info(fields, bpeProc), instance = #bpeProc{} },
              #table  { name = bpeEvent, fields = record_info(fields, bpeEvent), instance = #bpeEvent{} },
              #table  { name = sequenceFlow, fields = record_info(fields, sequenceFlow), instance = #sequenceFlow{} },
              #table  { name = 'userRole', fields = record_info(fields, 'userRole'), instance = #userRole{} },
              #table  { name = 'doclink', fields = record_info(fields, 'doclink'), instance = #doclink{}, keys = record_info(fields, 'doclink')},
              #table  { name = 'doclink_ref', fields = record_info(fields, 'doclink_ref'), instance = #doclink_ref{}, keys = record_info(fields, 'doclink_ref')},
              #table  { name = commonDoc, fields = record_info(fields, commonDoc), instance = #commonDoc{} },
              #table  { name = journalFilter, fields = record_info(fields, journalFilter), instance = #journalFilter{} },
              #table  { name = logsFilter, fields = record_info(fields, logsFilter), instance = #logsFilter{} },
              #table  { name = chatMessage, fields = record_info(fields, chatMessage), instance = #chatMessage{} },
              #table  { name = 'fileDesc', fields = record_info(fields, 'fileDesc'), instance = #'fileDesc'{} },
              #table  { name = crimes, fields = record_info(fields, crimes), instance = #crimes{} },
              #table  { name = crimesParty, fields = record_info(fields, crimesParty), instance = #crimesParty{} },
              #table  { name = crimeInquire, fields = record_info(fields, crimeInquire), instance = #crimeInquire{} },
              #table  { name = petition, fields = record_info(fields, petition), instance = #petition{} },
              #table  { name = courtOrder, fields = record_info(fields, courtOrder), instance = #courtOrder{} },
              #table  { name = orgEmail, fields = record_info(fields, orgEmail), instance = #orgEmail{} },
              #table  { name = sendEmailDoc, fields = record_info(fields, sendEmailDoc), instance = #sendEmailDoc{} },
              #table  { name = receiveEmailDoc, fields = record_info(fields, receiveEmailDoc), instance = #receiveEmailDoc{} },
              #table  { name = emailReceiver, fields = record_info(fields, emailReceiver), instance = #emailReceiver{} },
              #table  { name = tabInfo, fields = record_info(fields, tabInfo), instance = #tabInfo{} },
              #table  { name = project, fields = record_info(fields, project), instance = #project{} },
              #table  { name = projectUser, fields = record_info(fields, projectUser), instance = #projectUser{} },
              #table  { name = field, fields = record_info(fields, field), instance = #field{} },
              #table  { name = role, fields = record_info(fields, role), instance = #role{} },
              #table  { name = sign, fields = record_info(fields, sign), instance = #sign{} }
              #table  { name = inquireGrant, fields = record_info(fields, inquireGrant), instance = #inquireGrant{} },
              #table  { name = grantUnit, fields = record_info(fields, grantUnit), instance = #grantUnit{} },
              #table  { name = grantPermission, fields = record_info(fields, grantPermission), instance = #grantPermission{} },
              #table  { name = grantPermissionPOA, fields = record_info(fields, grantPermissionPOA), instance = #grantPermissionPOA{} },
              #table  { name = certificate, fields = record_info(fields, certificate), instance = #certificate{} },
              #table  { name = sendOrder, fields = record_info(fields, sendOrder), instance = #sendOrder{} },
              #table  { name = executor, fields = record_info(fields, executor), instance = #executor{}},
              #table  { name = assistantMark, fields = record_info(fields, assistantMark), instance = #assistantMark{}},
              #table  { name = rule, fields = record_info(fields, rule), instance = #rule{}, keys = record_info(fields, rule)},
              #table  { name = policy, fields = record_info(fields, policy), instance = #policy{}, keys = record_info(fields, policy)},
              #table  { name = rule_ref, fields = record_info(fields, rule_ref), instance = #rule_ref{} },
              #table  { name = subject_employee, fields = record_info(fields, subject_employee), instance = #subject_employee{}},
              #table  { name = request, fields = record_info(fields, request), instance = #request{}},
              #table  { name = context, fields = record_info(fields, context), instance = #context{}},
              #table  { name = object_process, fields = record_info(fields, object_process), instance = #object_process{} },
              #table  { name = object_file, fields = record_info(fields, object_file), instance = #object_file{}},
              #table  { name = object_form, fields = record_info(fields, object_form), instance = #object_form{}},
              #table  { name = object_corr, fields = record_info(fields, object_corr), instance = #object_corr{}},
              #table  { name = object_email, fields = record_info(fields, object_email), instance = #object_email{}},
              #table  { name = object_employee, fields = record_info(fields, object_employee), instance = #object_employee{}}
              #table  { name = rejectComment, fields = record_info(fields, rejectComment), instance = #rejectComment{}},
              #table  { name = sendInfo, fields = record_info(fields, sendInfo), instance = #sendInfo{}},
              #table  { name = report, fields = record_info(fields, report), instance = #report{}},
              #table  { name = reportCriteria, fields = record_info(fields, reportCriteria), instance = #reportCriteria{}},
              #table  { name = procChild, fields = record_info(fields, procChild), instance = #procChild{}, keys = record_info(fields, procChild)}
              #table  { name = procChild, fields = record_info(fields, procChild), instance = #procChild{}, keys = record_info(fields, procChild)},
              #table  { name = urgentLink, fields = record_info(fields, urgentLink), instance = #urgentLink{}},
              #table  { name = docTemplate, fields = record_info(fields, docTemplate), instance = #docTemplate{}}
            ].

pos(Doc,Field) ->
   Table = kvs:table(Doc),
   string:str([Doc|Table#table.fields], [Field]).

start(_,_) -> supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_) -> ok.
init([]) -> {ok, { {one_for_one, 5, 10}, []} }.
