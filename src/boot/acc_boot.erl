-module(acc_boot).
-compile(export_all).
-include("organization.hrl").
-include("person.hrl").
-include("employee.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/cursors.hrl").

'Sophia'(Sophia) -> [
  #'Employee' { person = #'Person'{cn = "Ayhan Rashidov"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Nedelcho Delchev"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Nikolay Dimitrov"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Rickard Andersson"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Borislava Velichkova"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Bozhidar Nikolov"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Dimitar Velev"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Stefan Radev"}, branch = Sophia },
  #'Employee' { person = #'Person'{cn = "Vasil Dabov"}, branch = Sophia }
  ].

'Varna'(Varna) -> [
  #'Employee' { person = #'Person'{cn = "Georgi Spasov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Hristo Mirchev"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Ivaylo Valkov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Maxim Sokhatsky"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Nikolay Kolev"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Polina Nestorova"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Radostin Dimitrov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Samir Barguti"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Stanislav Genchev"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Teodor Radev"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Todor Todorov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Valentin Atanasov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Vyacheslav Kara"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Anton Andonov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Artur Kratt"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Daniela Ivanova"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Dimitar Ivanov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Kristian Kirov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Lachezar Yankov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Pavel Kanchev"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Pavel Petrov"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Silviya Boncheva"}, branch = Varna },
  #'Employee' { person = #'Person'{cn = "Stanislav Dimov"}, branch = Varna }
  ].

'Plovdiv'(Plovdiv) -> [
  #'Employee' { person = #'Person'{cn = "Stilyana Runtashka"}, branch = Plovdiv },
  #'Employee' { person = #'Person'{cn = "Hristislav Gospodinov"}, branch = Plovdiv },
  #'Employee' { person = #'Person'{cn = "Hristina Sabeva"}, branch = Plovdiv }
   ].

boot() ->
    case kvs:get(writer,"/acc/quanterall/Varna") of
        {error,_} ->
    lists:map(fun(#'Branch'{ loc = #'Loc'{ city = City }} = B) ->
        Function = list_to_atom(City),
       [ begin
           kvs:append(X,"/acc/quanterall/" ++ City),
           kvs:put(#'PersonCN'{id=X#'Employee'.id,
                               cn=(X#'Employee'.person)#'Person'.cn})
         end || X <- ?MODULE:Function(City) ] end, kvs:feed("/erp/quanterall")); {ok,_} -> skip end.
