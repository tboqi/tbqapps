//设为首页
function setHomePage()
{
if(window.netscape)
  {
        try { 
          netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
        } 
        catch (e) 
        { 
          alert("抱歉！您的流浪其不支持直接设为首页"); 
        }
		var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
		prefs.setCharPref('browser.startup.homepage','http://www.chuanwen.com.cn'); 
  } 

  else
  }
  	window.external.addFavorite('http://www.chuanwen.com.cn','传闻网');
  }
}

//加入收藏
<!--
function addFavor(title, url){
if (document.all)
window.external.AddFavorite(url, title);
else if (window.sidebar)
window.sidebar.addPanel(title, url, "")
}
//-->