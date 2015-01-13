<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2&services=true"></script>
<title>插件</title>
<script type="text/javascript">
(function($){
	$.extend({
		xkmap:function(op){
			var map = new BMap.Map(op.container);
			map.setViewport(op.points);
			var polyline = new BMap.Polyline(op.points, {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
			map.addOverlay(polyline);
			var gc = new BMap.Geocoder();  
			map.addEventListener("click", function(e){       
				document.getElementById("info").innerHTML = e.point.lng + ", " + e.point.lat;
			    var pt = e.point;
			    gc.getLocation(pt, function(rs){
			        var addComp = rs.addressComponents;
			        alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " 
					        + addComp.street + ", " 
			        		+ addComp.streetNumber + ", " + rs.address);
			    });        
			});
		}
	});
})(jQuery)

$(document).ready(function(){
	var points = [
	              new BMap.Point(116.253903, 40.055193),
	              new BMap.Point(116.249384, 40.054592),
	              new BMap.Point(116.249214, 40.056587),
	              new BMap.Point(116.253498, 40.05707),
	              new BMap.Point(116.253903, 40.055193)
	            ];
	$.xkmap( {container:'container', points:points} ) ;
	var points2 = [
	              new BMap.Point(116.253903, 40.055193),
	              new BMap.Point(116.249384, 40.054592),
	              new BMap.Point(116.249214, 40.056587),
	              new BMap.Point(116.253498, 40.05707),
	              new BMap.Point(116.253903, 40.055193)
	            ];
	$.xkmap( {container:'container2', points:points2} ) ;
});
</script>
</head>
<body>
<div style="width:400px;height:300px;border:1px solid gray" id="container"></div>
<div id="info"></div>
<div style="width:400px;height:300px;border:1px solid gray" id="container2"></div>
</body>
</html>