/**
 * XULSchoolChrome namespace.
 */
if ("undefined" == typeof(XULSchoolChrome)) {
  var XULSchoolChrome = {};
};

/**
 * Controls the browser overlay for the Hello World extension.
 */
XULSchoolChrome.BrowserOverlay = {
  /**
   * Says 'Hello' to the user.
   */
  sayHello : function(aEvent) {
    var doc = window.getBrowser().selectedBrowser.contentDocument;
    //var url = doc.location.href;
    var url = gBrowser.contentDocument.location.href;
    var title = gBrowser.contentTitle;
    //alert(head.title);
    
    var metas = doc.getElementsByTagName("meta");
    var keywords = '';
    var desc = '';
    for (x in metas){
      if(metas[x].name == 'keywords') {
        keywords = metas[x].content;
      }
      if(metas[x].name == 'description') {
        desc = metas[x].content;
      }
    }
    
    var msg = 'URL: ' + url + '\n';
    msg += 'title: ' + title + '\n';
    msg += 'desc: ' + desc + '\n';
    msg += 'keywords: ' + keywords + '\n';

    window.alert(msg);
    
    //gBrowser.addTab('http://www.baidu.com');
  }
};
