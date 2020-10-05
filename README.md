# The project
 The Project is a telemedicine chat developed using the IRIS platform with WebSockets and FHIR API, which the doctor can use to talk to a patient or other healthcare professional.
 
# Coming soon
1 Finish the video conference system
2 Greater possibility of consult patients'clinical Observations

# The Software's Architecture 

The software has divided in the following structure 

Views - \fhirUI\views
Daos -\src\ChatSystem\dao
Dtos -\src\ChatSystem\dto
Services -\src\ChatSystem\services

The WebSockets server: \fhirUI\ServerWebSocket
The REST Api Dispatch: \src\ChatSystem\services\restApi

# Installation

 To use the app make sure you have git and Docker desktop installed.
 
 Execute 
 
 $ git clone https://github.com/Davi-Massaru/WebSocket_with_Fhir
 
 Open the terminal in this directory and run:

$ docker-compose up -d

Start the WebSockets Server and make sure the REST Api Dispatch has been added to your web applications


# References 

The project has developed with the help of the following article  https://community.intersystems.com/post/tutorial-websockets
And wiht the https://github.com/intersystems-community/iris-fhir-template.git 



