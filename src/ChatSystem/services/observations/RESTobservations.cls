Class ChatSystem.restApi.RESTobservations Extends %CSP.REST
{

ClassMethod GetVitalSignsDtoByPatientCode(pCodePatient As %Integer) As %Status
{
    Set %response.ContentType="application/json"
    Set service = ##class(ChatSystem.services.observations.observationsService).%New()
    Set dto = service.getVitalSignsDtoByPatientCode(pCodePatient)
    Do dto.WriteJson()
    Return $$$OK
}

ClassMethod GetLaboratoryObservations(pCodePatient As %Integer) As %Status
{
    Set %response.ContentType="application/json"
    Set service = ##class(ChatSystem.services.observations.observationsService).%New()
    Set dto = service.getLaboratoryObservationsByPatientCode(pCodePatient)
    Do dto.WriteJson()
    Return $$$OK
}

ClassMethod Ping() As %Status
{
    Return $$$OK
}

XData UrlMap
{
<Routes>
<Route Url="/LaboratoryObservations/:pCodePatient" Method="GET" Call="GetLaboratoryObservations"  Cors="true"/>
<Route Url="/VitalSigns/:pCodePatient" Method="GET" Call="GetVitalSignsDtoByPatientCode"  Cors="true"/>
</Routes>
}

}
