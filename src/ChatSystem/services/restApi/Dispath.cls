Class ChatSystem.restApi.dispath Extends %CSP.REST
{

ClassMethod Ping() As %Status
{
    Return $$$OK
}

ClassMethod PingPost() As %Status
{
    Set %response.ContentType="application/json"
    W (##class(%DynamicAbstractObject).%FromJSON(%request.Content.Read())).%ToJSON()
    Return $$$OK
}

XData UrlMap
{
<Routes>
<Map Prefix="/Observations*" Forward="ChatSystem.restApi.RESTobservations"/>

<Route Url="/ping/" Method="POST" Call="PingPost"  Cors="true"/>
<Route Url="/ping/" Method="GET" Call="Ping"  Cors="true"/>
</Routes>
}

}
