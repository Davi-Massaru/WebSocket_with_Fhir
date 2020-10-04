var myVideo = document.getElementById("myVideo");
var videoServer = document.getElementById('videoServer');

var constraints={
    video:true,
    audio:true
};

function main(){
    //drawCanvas();
}

navigator.mediaDevices.getUserMedia(constraints).then(function(stream){
    myVideo.srcObject=stream;
    myVideo.muted = 1;
    myVideo.play();
}).catch(function(err){
    
});

function drawCanvas(){
    context.drawImage(myVideo,0,0,canvas.width,canvas.height);
}