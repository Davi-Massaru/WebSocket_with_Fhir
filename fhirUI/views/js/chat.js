var alias="unknown";
var url = "ws://"+window.location.host+"/csp/user/fhirUI/ServerWebSocket/Chat.Server.cls";
var ws = new WebSocket(url); 

function init() {
$(".textmsg").each(function(d){$(this).text(btoa($(this).text()));})
$("#chatdiv").animate({ scrollTop: $('#chatdiv').prop("scrollHeight")}, 1000);
$("#inputline").focus()

//If a user presses "Enter" while in the message input box, trigger the "send()" function
$('#inputline').keypress(function (e) {
  if (e.which == 13) {
    send();
  }
});

ws.onopen = function(event) {
  document.getElementById("headline").innerHTML = "CHAT - connected";
};
/* When the WebSocket connection receives an incoming message, update the appropriate page 
 * elements according to type of message. Formats the incoming messages using wrapuser()
 * and wrapmessage() helper functions
 */
ws.onmessage = function(event) {
  var d=JSON.parse(event.data);

  if (d.Type=="Chat") {

    $("#chat").append(wrapmessage(d));
    $("#chatdiv").animate({ scrollTop: $('#chatdiv').prop("scrollHeight")}, 1000);

  } else if(d.Type=="userlist") {

      var ul = document.getElementById("userlist");

      while(ul.firstChild){
        ul.removeChild(ul.firstChild)
      };

      $("#userlist").append(wrapuser(d.Users));

  } else if(d.Type=="Status"){
    document.getElementById("headline").innerHTML = "CHAT - connected - "+d.WSID;
  }
  
};

ws.onerror = function(event) {
  document.GetElementById("headline").innerHTML = "CHAT - error";
  alert("Received error"); 
 };
 
}

/* 
* Sends messages to the server via the ws.send()
* If the data is not an alias update, encode the message using base64-enocding
*/
function send() {
  var line=$("#inputline").val();
  if (line.substr(0,5)==     "alias"){
    alias=line.split(" ")[1];
    if (alias==""){
      alias="default";
    }
    var data = {}
    data.User = alias
    console.log("send to Server: ",data);
    ws.send(JSON.stringify(data));
  }else if(line.substr(0,4)=="show"){

    fetch('http://localhost:32783/rest/ChatSystem/Observations/VitalSigns/1')
          .then(response => response.json())
          .then(data => {
                          data["ListObservations"].forEach(element => {
                             var data = {}
                             data.Author = "SYSTEM"
                             data.Message =  " VitalSigns: " + element.text
                             data.Message += " Value: " + element.value + " " + element.unit
                             data.Message +="  Data: " + element.occurrenceData
                             $("#chat").append(wrapmessage(d));
                          });

                        });
      
  }else{
    var msg=btoa(line);
    var data={};
    data.Message=msg;
    data.Author=alias;
    if (ws && msg!="") {
      console.log("send to Server: ",data);
      ws.send(JSON.stringify(data));
    }
}
$("#inputline").val("");
}

/*
* Formats message data with html tags
*/
function wrapmessage(data) {


  console.log("received from the server: ",data);
  var html=[];

    html.push('<li class="media">');
    html.push('<div class="media-body">');
    html.push('<div class="media">');
    html.push('<p>'+data.Author+'</p>');
    html.push('<div class="media-body" >');
    html.push(atob(data.Message));
    html.push('<br />');
    html.push('<small class="text-muted">');
    html.push(data.Sent);
    html.push('</small><hr /></div></div></div></li>');
    
  return html.join("");
}

/*
* Formats user data with html tags
*/
function wrapuser(data){
  console.log("wrapuser data: ",data);
  var html=[];
  for (i=0;i<data.length;i++){
    html.push('<li class="media">');
    html.push('<div class="media-body">');
    html.push('<p>');
    html.push(data[i].User);
    html.push('</p>');
    html.push('</div></li>');
  }
  return html.join("");
}

