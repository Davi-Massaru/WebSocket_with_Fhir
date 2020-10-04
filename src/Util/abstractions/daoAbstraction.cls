Class Util.abstractions.daoAbstraction Extends %Library.RegisteredObject
{

Method executeSql(pSql) As %SQL.StatementResult
{
    Set tStatement = ##class(%SQL.Statement).%New()
    Set status = tStatement.%Prepare(pSql)
    Set rset = tStatement.%Execute()
    Return rset
}

}
