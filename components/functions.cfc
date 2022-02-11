component { 

    remote function locFunction(required string id) { 
        cfquery( name="loclist", datasource="bus_ticket", result="xResult" ) { 
            writeOutput("SELECT name FROM city
            WHERE name LIKE "); cfqueryparam( cfsqltype="cf_sql_varchar", VALUE=id&'%');
        }
       //return loclist;
        cfoutput( QUERY="loclist" ) {
            writeOutput("<ul class=""list-group"">
                            <li class=""list-group-item"">#name#</li>
                        </ul>");
        }
    }
}