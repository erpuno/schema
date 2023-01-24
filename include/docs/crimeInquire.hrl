-ifndef(CRIME_INQUIRE_HRL).
-define(CRIME_INQUIRE_HRL, true).

-include("erp/catalogs/dict.hrl").
-include("erp/catalogs/person.hrl").
-include("erp/catalogs/crimesParty.hrl").
-include("erp/catalogs/location.hrl").
-include("erp/catalogs/organization.hrl").
-include("erp/catalogs/address.hrl").

% Продукт: МІА: Документообіг
% Розширення: МІА: Провадження
% Документ-об'єкт: Провадження
% На підставі: https://zakon.rada.gov.ua/laws/show/v0298905-20

% Словники використані в розширенні МІА: Провадження:
% /crimes/inquires
% /crimes/inquireSources
% /crimes/inquireDepartment
% /crimes/preventions
% /crimes/severity
% /crimes/object
% /crimes/militaryNotes
% /crimes/additionalNotes
% /crimes/placeCode
% /crimes/placeClosedCode
% /crimes/placePublicCode
% /crimes/placeSecurityCode
% /crimes/ecological
% /crimes/economical
% /crimes/weapon

-record(economical, { id, desc, nace, isic }).     % Довідник 4

-record(crimeInquire, {
    id= [] :: [] | binary(),                       % GUID ідентифікатор
    document_type = [] :: [] | binary(),
    issuedOrg = [] :: [] | #'Organization'{},           % Найменування органу який розпочав досудове розслідування
    category = [] :: [] | binary(),                % Врахувати тип кримінального провадження
    regNum = [] :: [] | binary(),                  % Номер кримінального провадження (17-знаків)
    regDate=[] :: [] | calendar:datetime(),        % Дата введення в ЄРДР
    registered_by = [] :: [] | #'Employee'{},      % Відомості введено
    approved_by = [] :: [] | #'Employee'{},        % Відомості перевірено
    inquireId = [] :: [] | binary(),               % Номер надходження
    inquireDate = [] :: [] | calendar:datetime(),  % Дата надходження
    surname = [] :: [] | binary(),                 % Прізвище заявника
    middlename = [] :: [] | binary(),              % По-батькові заявника
    firstname = [] :: [] | binary(),               % Ім'я заявника
    identity = [] :: [] | binary(),                % Ідентифікаційний код особи ЄДРПО ібо ІПН
    companyName = [] :: [] | binary(),             % Найменування юридичної особи
    address = [] :: [] | #'Address'{},             % Адреса заявника
    otherType = [] :: [] | #dict{},                % Інше джерело /crimes/inquireSource
    department = [] :: [] | #dict{},               % Виявлене службою органу /crimes/inquireDepartment
    crimeDate = [] :: [] | calendar:datetime(),    % Дата вчинення правопорушення
    crimeReason = [] :: [] | binary(),             % Підстава
    criminal = [] :: [] | binary(),                % Вид особи, що вчинила правопорушення
    content = [] :: [] | binary(),                 % Короткий виклад обставин, що можуть свідчити про вчинення кримінального правопорушення (фабула)
    crime1960 = [] :: [] | binary(),               % Кваліфікація кримінального злочину (КК України 1960 року)
    misdemeanor2001 = [] :: [] | binary(),         % Кваліфікація кримінального проступку (КК України 2001 року)
    offense2001 = [] :: [] | binary(),             % Кваліфікація кримінального правопорушення (КК України 2001 року)
    large = [] :: [] | binary(),                   % У особливо великих розмірах
    severity = [] :: [] | #dict{},                 % Класифікація кримінальних правопорушень по тяжкості /crimes/severity
    prevented = [] :: [] | #dict{},                % Правопорушення попереджене /crimes/preventions
    preventedCode = [] :: [] | #dict{},            % Правопорушення попереджене працівником /crimes/inquireDepartment
    ecological = [] :: [] | #dict{},               % Класифікатор впливу на хорону навколишнього природного середовища /crimes/ecological
    additionalNotes = [] :: [] | #dict{},          % Додаткові відмітки
    atoRelated = [] :: [] | #dict{},               % Відношення до антитерорестичної операції (АТО) об'єднаних сил
    humanRights = [] :: [] | #dict{},              % Класифікатор вплину на захист прав громадян
    objectCode = [] :: [] | #dict{},               % Предмет кримінального провадження /crimes/object
    placeCode = [] :: [] | #dict{},                % Місце вчинення правопорушення /crimes/placeCode
    attachments = [] :: list(),                    % Додатки
    placeClosedCode = [] :: [] | #dict{},          % На закритих об'єктах /crimes/placeClosedCode
    placePublicCode = [] :: [] | #dict{},          % Громадське місце /crimes/placePublicCode
    placeSecuredCode = [] :: [] | #dict{},         % Охорона об'єкта /crimes/placeSecurityCode
    crimeOrg = [] :: [] | #'Organization'{},       % Найменування підприємства де скоїно злочин
    militaryNotes = [] :: [] | #dict{},            % Окремі відмітки для військових формувань та об’єднань (за Довідником 12) /crimes/militaryNotes
    militaryUnits = [] :: [] | #dict{},            % Військові формування, органи спеціального призначення, державні органи у сфері оборони, у яких вчинено злочин (за Довідником 11) /crimes/militaryUnits
    economical = [] :: [] | #economical{},         % Види економічної діяльності, у яких учинено правопорушення (за Довідником 4) /crimes/economnical
    weapons = [] :: [] | list(#dict{}),            % Знаряддя та засоби вчинення правопорушення (за Довідником 5) /crimes/weapon
    demageAmount = [] :: [] | integer(),           % Сума матеріальних збитків (розмір шкоди, заподіяної потерпілому) (тис. грн)
    demageLegalized = [] :: [] | integer(),        % Установлена сума легалізованих доходів, одержаних кримінально-протиправним шляхом (тис. грн)
    demagePrevented = [] :: [] | integer(),        % Сума попереджених збитків (тис. грн)
    victims = [] :: [] | list(#crimesParty{}),     % Відомості про потерпілих
    placeInspected = [] :: [] | #dict{},           % Огляд місця події проводився працівниками (за Довідником 1) /crimes/inquireSource
    etc = [],
    seq_id = [] :: [] | binary()
 }).

% /crimes/preventions
% На стадії готування (1)
% На стадій замаху (2)

% /crimes/inquireSource
% Усна заява (повідомлення) про кримінальне правопорушення.
% Повідомлення підприємств, установ, організацій і посадових осіб.
% Матеріали правоохоронних та контролюючих державних органів про виявлення фактів вчинення чи підготовки до вчинення кримінальних правопорушень.
% Повідомлення представників влади, громадськості або окремих громадян, які затримали підозрювану особу, відповідно до частини другої статті 207 КПК України.
% Повідомлення в засобах масової інформації.
% Самостійне виявлення слідчим/дізнавачем (уповноваженою особою іншого підрозділу) кримінального правопорушення, у тому числі під час досудового розслідування.
% Дублікат заяви.
% Самостійне виявлення прокурором кримінального правопорушення за результатами перевірки у порядку нагляду.
% Самостійне виявлення прокурором кримінального правопорушення.
% Інші.

% /crimes/crimeReason
% За результатами перевірки узагальнених матеріалів Держфінмоніторингу
% Держфінінспекції
% На підставі рішення суду України про зобов’язання внесення відомостей про кримінальне правопорушення до ЄРДР
% Пов’язане з виконанням рішення Європейського суду з прав людини

% /crimes/inquireDepartment
% ДОВІДНИК 2

% /crimes/ecological
% Кримінальне правопорушення, не пов’язане з охороною навколишнього природного середовища і земельних відносин (1)
% Кримінальне правопорушення, пов’язане з охороною  навколишнього природного середовища і земельних відносин (2)
% У тому числі річки Дніпро, її водосховищ, Дніпровсько-Бузького  лиману, їх водоохоронних зон та прибережних смуг (3)
% З них вчинене на підприємствах, які здійснюють скиди у річку Дніпро, її водосховища та Дніпровсько-Бузький лиман (4)

% /crimes/additionalNotes
% ДОВІДНИК 9

% /crimes/object
% Транспортні засоби: автомобіль легковий 01, вантажний 03; причеп 132, напівпричеп 133, автобус 05, трамвай (тролейбус) 134, мотоцикл 07, мопед 08, велосипед 09, трактор 10, сільськогосподарська техніка 11, інші транспортні засоби 12.
% Деталі автомашин: лобове скло 13, колеса 14, авторадіоапаратура 15, акумулятор 16, інші запчастини 17, номерні знаки 18.
% Гроші, цінні папери, фінансово-платіжні документи: гроші 19, валюта 20, бюджетні кошти 143, державні кошти 145, акції 21, авізо 22, кредитні картки 23, чекові книжки 24, вексель 25, облігації 26, чеки 27, сертифікати 28, лотерейні квитки 29, інші 30.
% Документи: паспорт 31, посвідчення особи 32, інші 33.
% ДОВІДНИК 6

% /crimes/placeCode
% м. Київ (01),
% м. Сімферополь (02),
% м. Севастополь (03),
% обласний центр (04),
% місто (05),
% селище міського типу (06),
% сільська місцевість (07),
% за межами населеного пункту (08),
% у тому числі  на  автодорогах (09),
% автомагістралях (10),
% в межах річки Дніпро, її водосховищ, Дніпровсько-Бузького лиману, їх водоохоронних зон та прибережних смуг (11),
% територія, приміщення Державної кримінально-виконавчої служби України (27)
% Для транспортних підрозділів: поїзд далекого сполучення (12),
% у тому числі пасажирський (13),
% приміський поїзд (14),
% вантажний поїзд (15),
% вокзал (16),
% зупиночна платформа (17),
% на повітряному (18),
% річковому (19),
% морському (20),
% магістральному трубопровідному (21),
% автомобільному (22)
% транспорті, у сфері автодорожнього комплексу (23),
% у метрополітені (24),
% інші на транспорті (25),
% у зоні проведення антитерористичної операції, операції Об’єднаних сил (26),
% на тимчасово окупованій території (28),
% лінії розмежування (29),
% блокпосту (30)

% /crimes/placeClosedCode
% УВП (1),
% ІТТ (2),
% СІЗО (3),
% ВК (14),
% ДСР-ВК (15),
% ВЦ (16),
% спецприймальник (4),
% приймальник-розподільник (5),
% спецміліція (6),
% територія військової частини (7),
% територія житлової зони закритого військового містечка (8),
% кімната для доставлених чергових частин правоохоронних органів (9),
% закриті психіатричні лікарні та заклади судово-психіатричної експертизи для осіб, взятих під варту, МОЗ України (10),
% пункти тимчасового тримання іноземців та осіб без громадянства, які незаконно перебувають в Україні (11),
% у тому числі нелегальних мігрантів (12),
% біженців (13)

% /crimes/placePublicCode
% Вулиця (дорога),  площа, парк, сквер (01),
% Автомагістралі (02),
% Ринок (03),
% Громадський транспорт (04),
% Інші місця (05)
% Для транспортних підрозділів: поїзд далекого сполучення (06),
% Літак (07),
% Корабель (08),
% Приміський поїзд (09),
% Вокзал, станція (10),
% Аеровокзал (11),
% Річний, морський вокзал, пристань (12),
% Інші місця (13)

% /crimes/placeSecurityCode
% відомча (1),
% недержавна (2),
% відсутня (5),
% інша (6),
% військова варта (7),
% військовий патруль (8),
% підрозділи поліції охорони Національної поліції (9),
% інші підрозділи Національної поліції (10)

% /crimes/weapon
% Зброя вогнепальна нарізна: гвинтівки, карабіни бойові 01,
% автомати 02, пістолети-кулемети (кулемети) 03,
% пістолети (револьвери) 08,
% гвинтівки, карабіни мисливські 04,
% рушниці комбіновані 06,
% гвинтівки спортивні 07;
% гладкоствольна: рушниці мисливські 05,
% обрізи всіх видів (нарізної зброї та гладкоствольних рушниць) 10;
% саморобна зброя 11;
% Пристрої для відстрілу патронів несмертельної дії (у тому числі з гумовою кулею): пістолети, револьвери 12.
% Пневматична зброя 14.
% рушниці бойові 97;
% інша вогнепальна зброя 98.

-endif.
