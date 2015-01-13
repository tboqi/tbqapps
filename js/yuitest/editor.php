<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
 <head>
  <title> New Document </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
	<!-- Skin CSS file --> 
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.5.1/build/assets/skins/sam/skin.css"> 
	<!-- Utility Dependencies --> 
	<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>  
	<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/element/element-beta-min.js"></script>  
	<!-- Needed for Menus, Buttons and Overlays used in the Toolbar --> 
	<script src="http://yui.yahooapis.com/2.5.1/build/container/container_core-min.js"></script> 
	<!-- Source file for Rich Text Editor--> 
	<script src="http://yui.yahooapis.com/2.5.1/build/editor/simpleeditor-beta-min.js"></script> 
  <script language="JavaScript">
  <!--
  function createEditor(areaId) {
    var editor = new YAHOO.widget.SimpleEditor(areaId, { 
      height: '300px', 
      width: '622px', 
      dompath: false,
      animate: true, 
      toolbar: { 
        buttons: [ 
          { group: 'textstyle', 
            buttons: [ 
              { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' }, 
              { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' }, 
              { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' }, 
              { type: 'color', label: 'Background Color', value: 'backcolor', disabled: true } 
            ] 
          } 
        ]
      }
    }); 
    return editor;
  }
  var myEditor1 = createEditor("msgpost1");
  myEditor1.render(); 
  var myEditor2 = createEditor("msgpost2");
  myEditor2.render(); 
  function sub(){
    myEditor1.saveHTML(); 
    //var html = myEditor.get('element').value; 
    //alert(document.getElementById("msgpost").value);
  }
  
  //myEditor.execCommand('backcolor', 'red');
	myEditor1.on('editorMouseUp',function(){
    this.execCommand('inserthtml', '<span style="background-color: #ffff00;"></span>'); 
    //this.execCommand('backcolor', 'red');
    //alert("111111111");
  });
  //-->
  </script>
 </head>

 <body class="yui-skin-sam">
 <form action="" onsubmit="sub();" method="post">
		<textarea name="msgpost1" id="msgpost1" cols="50" rows="10"> 
	    1111111111<strong>Your</strong> HTML <em style="background-color: #60bf00;">code</em> goes here.<br> 
	  This text will<span style="background-color: #60bf00;"> be pre-loade</span>d in the<span style="background-color: #ffff00;"> editor when it </span>is rendered.
	</textarea>
  <textarea name="msgpost2" id="msgpost2" cols="50" rows="10"> 
	   2222222 <strong>Your</strong> HTML <em style="background-color: #60bf00;">code</em> goes here.<br> 
	  This text will<span style="background-color: #60bf00;"> be pre-loade</span>d in the<span style="background-color: #ffff00;"> editor when it </span>is rendered.
	</textarea>
  <input type="submit">
  </form>
 </body>
</html>
<?php
echo stripslashes ($_POST['msgpost1']);
?>
