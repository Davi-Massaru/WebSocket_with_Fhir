Class Util.abstractions.dtoAbstraction Extends %Library.RegisteredObject
{

Method WriteJson() As %Status
{
    Do ##class(%ZEN.Auxiliary.jsonProvider).%ObjectToJSON($THIS)
    Return $$$OK
}

}
