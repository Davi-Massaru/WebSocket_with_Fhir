Class ChatSystem.dao.observations.observationsDao Extends Util.abstractions.daoAbstraction
{

Method OpenObservation(pKey As %String) As ChatSystem.dto.observations.observationDto
{
    set observationDto = ##class(ChatSystem.dto.observations.observationDto).%New()
    set sql=" SELECT TOP 1 "_
            " GetProp( GetJSON(ResourceString,'code'),          'text' ) As text , "_
            " GetProp( GetJSON(ResourceString,'valueQuantity'), 'value') as value, "_ 
            " GetProp( GetJSON(ResourceString,'valueQuantity'), 'unit') as unit, "_
            " GetProp(ResourceString,'effectiveDateTime') as occurrenceData "_
            " FROM HSFHIR_I0001_R.Rsrc "_
            " WHERE "_
            " Deleted <> 1 AND "_
            " Key = '"_pKey_"' "

    set result = ..executeSql(sql)

    if result.%Next(){
        set observationDto.code = pKey
        set observationDto.occurrenceData = result.occurrenceData
        set observationDto.text = result.text
        set observationDto.value = result.value
        set observationDto.unit = result.unit
    }

    Return observationDto
}

Method getLaboratoryObservationsByPatientCode(pPatientCode As %String) As %SQL.StatementResult
{
    set sql="SELECT TblObservation.Key AS KEY "_
                " FROM HSFHIR_I0001_S.Observation AS TblObservation "_
                " WHERE "_
                " TblObservation.category [ 'laboratory' AND "_
            " TblObservation.patient='Patient/"_pPatientCode_"' "
    Return ..executeSql(sql)
}

Method getVitalSignsByPatientCode(pPatientCode As %String) As %SQL.StatementResult
{
    set sql="SELECT TblObservation.Key AS KEY "_
                " FROM HSFHIR_I0001_S.Observation AS TblObservation "_
                " WHERE "_
                " TblObservation.category [ 'vital-signs' AND "_
            " TblObservation.patient='Patient/"_pPatientCode_"' "
    Return ..executeSql(sql)
}

}
