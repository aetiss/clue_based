<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <script type="text/javascript">
    var watchID;
    var geoLoc;
    function showLocation(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        window.location.replace("update_location1.jsp?latitude="+latitude+"&"+"longitude="+longitude);
        
    }
         
    function errorHandler(err) {
        if(err.code == 1) {
            alert("Error: Access is denied!");
        }
            
        else if( err.code == 2) {
            alert("Error: Position is unavailable!");
        }
    }
         function getLocationUpdate(){
        if(navigator.geolocation){
            // timeout at 60000 milliseconds (60 seconds)
            var options = {timeout:6000000};
            geoLoc = navigator.geolocation;
            watchID = geoLoc.watchPosition(showLocation, errorHandler, options);
        }
        else{
            alert("Sorry, browser does not support geolocation!");
        }
    }
    window.onload = getLocationUpdate();
</script>

    </body>
</html>
