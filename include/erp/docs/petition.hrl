-ifndef(PETITION_HRL).
-define(PETITION_HRL, true).

% Продукт: МІА: Документообіг
% Розширення: МІА: Провадження
% Документ-об'єкт: Клопотання
% На підставі: https://zakon.rada.gov.ua/laws/show/z0860-06

% Форми докментів (судова система):
% ДОДАТОК 008 Кримінальне провадження у порядку виконання судових рішень (Клопотання)
% ДОДАТОК 018 Справа про визнання та виконання рішень іноземних судів в Україні (Клопотання)
% ДОДАТОК 028 Справа в порядку виконання постанов у справах про адміністративні правопорушення (Клопотання)
% ДОДАТОК 059 Матеріали в порядку надання міжнародної правової допомоги (Клопотання)

-include_lib("schema/include/erp/catalogs/dict.hrl").
-include_lib("schema/include/erp/catalogs/fileDesc.hrl").
-include_lib("schema/include/erp/catalogs/person.hrl").
-include_lib("schema/include/erp/catalogs/crimesParty.hrl").
-include_lib("schema/include/erp/catalogs/location.hrl").
-include_lib("schema/include/erp/catalogs/organization.hrl").
-include_lib("schema/include/erp/catalogs/address.hrl").

% ДОДАТОК 100 Кримінальне провадження про тримання під вартою

-record(petition, {
    id = [] :: binary(),
    petition_type = [] :: [] | binary(), % Вид клопотання
    guid = [] :: list(),
    court = [] :: [] | #'Organization'{}, % Організація повинна містити ЄДРПО судової установи
    city = [] :: [] | binary(), % місто вибирається автоматично з організації
    date = [] :: [] | calendar:datetime(), % Дата складання клопотання. Присвоюється автоматично після підписання слідчим.
    officer = [] :: [] | #'Employee'{}, % Користувач системи
    crimeInqNum = [] :: [] | binary(), % Номер клопотання (згідно номенклатури документообігу проваджень, автолічильник)
    crimeInqDate = [] :: [] | calendar:datetime(), % Виставляється автоматично. Підтягується від інформації про Кримінальне провадження (справу, crimeInq).
    fabula = [] :: [] | binary(), % Автоматично вже містить готовий текст із поля «Фабула» із інформації про Кримінальне провадження (справу)
    suspect = [] :: [] | #crimesParty{}, % Вибір особи сі статусом «Підозрюваний» у кримінальному провадженні. Ввід через comboLookupEdit, як кореспондентів.
    message = [] :: [] | binary(), % Повідомлення про підозру
    qualify = [] :: [] | #dict{}, % Встановлюється автоматично з crimeInq. На початкових етапах можна розробити ручне обрання із довідника «Кримінальний кодекс» /crimes/index
    subqualify = [] :: [] | binary(), % Кваліфікація
    duties = [] :: [] | list({#dict{},binary()}), % Перелік обов'язків з довідника /crimes/duties та їх текстових обгрунтувань
    risks = [] :: [] | list({#dict{},binary()}), % Перелік ризиків з довідника /crimes/risks та їх текстових обгрунтувань
    attachments = [] :: list(#fileDesc{}), % Файли-додатки
    legal = [] :: list(#fileDesc{}), % Інші Файли-додатки
    prosecutor = [] :: [] | #crimesParty{}, % Один із учасників кримінального провадження зі статусом «Прокурор»
    prosecutorAgreementDate = [] :: [] | calendar:datetime(), % Користувач вказує дату погодження прокурором.
    etc = [],
    seq_id = [] :: [] | binary()
    }).

-endif.
