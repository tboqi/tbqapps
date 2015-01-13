<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<head>
<script type="text/javascript" src="jquery-1.2.3.js"></script>
<script type="text/javascript" src="jquery.form.js"></script>

<script type="text/javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    var options = { 
        target:        '#output1',
        beforeSubmit:  showRequest,
        success:       showResponse 
    }; 
    $('#myForm').ajaxForm(options); 
}); 
 
function showRequest(formData, jqForm, options) { 
    var queryString = $.param(formData); 
    //alert('About to submit: \n\n' + queryString); 
    return true; 
} 
 
function showResponse(responseText, statusText)  { 
    alert('status: ' + statusText + '\n\nresponseText: \n' + responseText + 
        '\n\nThe output div should have already been updated with the responseText.'); 
} 
</script>
</head>

<BODY>
<div id="output1"></div>
<form id="myForm" action="uploadimg_run.php" method="post"> 
<input name="MAX_FILE_SIZE" value="3000000" type="hidden">
                File: <input name="file" type="file">
<input type="submit" value="Submit Comment" /> 
</form>
</BODY>
</HTML>
