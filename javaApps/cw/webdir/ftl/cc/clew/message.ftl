#{clew.id}. <a href="/showRemark!showClew.action?remarkId=#{clew.id}" target="_blank">${clew.title}</a>&nbsp;
			<#if clew.status=-1>
				[<font color="red">被屏蔽</font>]&nbsp;[<a href="#" onclick="unScreen(#{clew.id})">取消屏蔽</a>]
			<#else>
				[正常]&nbsp;[<a href="#"onclick="screen(#{clew.id})">屏蔽</a>]</#if>
			[<a href="/r/#{clew.articleId}" target="_blank">原文</a>]