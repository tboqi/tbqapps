${article.title}&nbsp;
			<#if article.status=-1>
				[<font color="red">被屏蔽</font>]&nbsp;[<a href="#" onclick="unScreen(#{article.id})">取消屏蔽</a>]
			<#else>
				[正常]&nbsp;[<a href="#"onclick="screen(#{article.id})">屏蔽</a>]</#if>[<a href="#" onclick="screenPic(#{article.id})">屏蔽图片</a>]