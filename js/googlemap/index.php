<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<style type="text/css">
  html { height: 100% }
  body { height: 100%; margin: 0px; padding: 0px }
  #map_canvas { height: 400px;width: 600px }
</style>
<title>Google Maps JavaScript API v3 Example: Map Simple</title>
<script type="text/javascript">
  function initialize() {
    var myLatlng = new google.maps.LatLng(39.92, 116.46);
    var myOptions = {
      zoom: 10,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  }
  
  function loadScript() {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "http://maps.google.com/maps/api/js?sensor=false&callback=initialize";
    document.body.appendChild(script);
  }
  
  window.onload = loadScript;
</script>
</head>
<body>
  <div id="map_canvas"></div>
</body>
</html>


