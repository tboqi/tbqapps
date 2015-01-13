

var url = "http://www.chuanwen.com.cn/output.action?needSize="+needSize
+"&picSize="+picSize
+"&width="+output_width
+"&height="+output_height
+"&mode="+mode
+"&site="+site;

var iframeObj = "<IFRAME id='ad' SRC='" + url + "' marginwidth='0' marginheight='0' ";
iframeObj += " width=" + output_width + " height=" + output_height + " scrolling='no' FRAMEBORDER='0'></IFRAME>";
document.write(iframeObj);