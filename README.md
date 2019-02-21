ERP: Enterprise Resource Planing
================================

Intro
-----

Boot Enterprise:

```erlang
$ mad dep com pla rep
> erp:boot().
[{group,6},{parties,3}]
```

Get list of companies that form a group (transnational corporation, holding, daughters) of owner:

```> erp:group().
[{'Organization',6,[],5,"O7","github.com/o7",[]},
 {'Organization',5,6,4,"O3","github.com/o3",[]},
 {'Organization',4,5,3,"O1","github.com/o1",[]},
 {'Organization',3,4,2,"Groupoid","github.com/groupoid",[]},
 {'Organization',2,3,1,"Enterprizing", "github.com/enterprizing",[]},
 {'Organization',1,2,[],"Synrc","github.com/synrc",[]}]
```

Get list of third-party companies, or contra agents:

```erlang
> erp:parties().
[{'Organization',9,[],8,"ERP+SCM","github.com/supply",[]},
 {'Organization',8,9,7,"NYNJA Group","github.com/nynja-mc", []},
 {'Organization',7,8,[],"Privat48","github.com/privat48",[]}]
```

Credits
-------

* Maxim Sokhatsky
