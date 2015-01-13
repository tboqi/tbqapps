var oFileChecker = $("fileChecker");
var flag = 0;
function changeSrc(img)
{
    oFileChecker.src = img.value;
}

oFileChecker.onreadystatechange = function ()
{
    if (oFileChecker.readyState == "complete")
    {
        checkSize();
    }
}

function checkSize()
{
    var limit  = 50 * 1024;
	var f = $("submit");
    if (oFileChecker.fileSize > limit)
    {
        alert("请上传低于50k的文件");
		flag = 1;
		f.disabled=1;
		return false;
    }
	else{
		f.disabled=0;
	}
}

function uploadImg(){
		var url = "/cw/UploadClewImgProcessor.ajax";
		var pars = "img=" + $F("img");
		
		var ajax = new Ajax.Request(
		url,
		{
			method: 'post',
			parameters: pars,
			onComplete: uploadImgResponse,
			onFailure: uploadImgError
		});
}

function uploadImgResponse(XHR){
		var xml = XHR.responseXML;
		var statusValue = xml.getElementsByTagName("status")[0].firstChild.nodeValue;
		if("OK"==statusValue){
			$("label").style.display = 'none';
			alert("添加标签成功!");
		}
}

function uploadImgError(){
	alert("error");
}
