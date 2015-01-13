<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>百度地图damo</title>
</head>
<body>
<ul>
	<li>选择跑步的关键点</li>
</ul>
<div></div>
<div id="info"></div>
<button id="button">我做完了，提交线路</button><button id="chexiao">撤销</button>
<div style="width:400px;height:300px;border:1px solid gray" id="xkmap"></div>
<div id="results"></div>
</body>
</html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2&services=true"></script>
<script type="text/javascript">
$(function(){
	var map = new BMap.Map("xkmap");
	map.centerAndZoom(new BMap.Point(116.253903, 40.055193),18);
	map.enableScrollWheelZoom();

	var points = [];
	var points1 = [];
	var currentPoint;
	var hasMarked = false;
	var marker;
	var polyline;
	var distance = 0;
	
	map.addEventListener("click", function(e){
		if(points.length >= 1) {
			var options = {
				//renderOptions:{map: map, autoViewport: true},
				onSearchComplete: function(results){
				    if (driving.getStatus() == BMAP_STATUS_SUCCESS){
					    // 获取第一条方案
					    var plan = results.getPlan(0);
					    // 获取方案的驾车线路
					    var route = plan.getRoute(0);
					    var points3 = route.getPath();
					    if(points.length >= 1) {
							var polyline1 = new BMap.Polyline(points3, {strokeColor:"red", strokeWeight:3, strokeOpacity:0.5});
							map.addOverlay(polyline1);
						}
				    }
				}
			};
			var driving = new BMap.WalkingRoute(map, options);
			driving.search(points[points.length - 1], e.point);
		}
		
		points.push(e.point);
		map.clearOverlays();
		drawPolyline();
		drawMarker(e.point);
	});

	$('#chexiao').click(function(){
		map.clearOverlays();
		points.pop();
		drawPolyline();
		if(points.length > 0) {
			drawMarker(points[points.length-1]);
		} else {
			hasMarked = false;
		}
	});

	function drawMarker(point) {
		marker = new BMap.Marker(point);
		map.addOverlay(marker);
		hasMarked = true;
		map.setViewport(points);
	}

	function drawPolyline() {
		if(points.length >= 1) {
			polyline = new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
			map.addOverlay(polyline);
			hasPolyline = true;
		}
		getDistance();
	}

	function drawPolyline2() {
		if(points1.length >= 1) {
			polyline2 = new BMap.Polyline(points1, {strokeColor:"red", strokeWeight:2, strokeOpacity:0.5});
			map.addOverlay(polyline2);
		}
	}

	function getDistance() {
		distance = 0;
		if(points.length >= 2) {
			for(var i = 0; i <= points.length - 2; i++) {
				distance += map.getDistance(points[i], points[i+1]);
			}
		}
		$('#info').html(distance);
	}
});
</script>