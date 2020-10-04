Class ChatSystem.services.observations.observationsService Extends Util.abstractions.daoAbstraction
{

Method getLaboratoryObservationsByPatientCode(pPatientCode) As ChatSystem.dto.observations.lists.observationDto
{
    Set dao = ##class(ChatSystem.dao.observations.observationsDao).%New()
    Set laboratoryObservationsKeys = dao.getLaboratoryObservationsByPatientCode(pPatientCode)

    Set list = ##class(ChatSystem.dto.observations.lists.observationDto).%New()
    While laboratoryObservationsKeys.%Next(){
        Set ObservationDto = ##class(ChatSystem.dto.observations.observationDto).%New()
        Set ObservationDto = dao.OpenObservation(laboratoryObservationsKeys.KEY)
        Do list.ListObservations.Insert(ObservationDto)
    }

    Return list
}

Method getVitalSignsDtoByPatientCode(pPatientCode As %String) As %SQL.StatementResult
{
    Set dao = ##class(ChatSystem.dao.observations.observationsDao).%New()
    Set laboratoryObservationsKeys = dao.getVitalSignsByPatientCode(pPatientCode)

    Set list = ##class(ChatSystem.dto.observations.lists.observationDto).%New()
    While laboratoryObservationsKeys.%Next(){
        Set ObservationDto = ##class(ChatSystem.dto.observations.observationDto).%New()
        Set ObservationDto = dao.OpenObservation(laboratoryObservationsKeys.KEY)
        Do list.ListObservations.Insert(ObservationDto)
    }
    
    Return list
}

}
