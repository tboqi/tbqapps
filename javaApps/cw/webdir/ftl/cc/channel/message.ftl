${channel.name}(${channel.articleNums})&nbsp;
			<#if channel.tuijian=0>[推荐]
			<#else>
			[不推荐]
			</#if>
			<#if channel.state=3>
				[<font color="red">被屏蔽</font>]&nbsp;[<a href="#" onclick="unScreen(#{channel.id})">取消屏蔽</a>]
			<#else>
				[正常]&nbsp;[<a href="#"onclick="screen(#{channel.id})">屏蔽</a>]</#if>
			<#if channel.tuijian=0>[<a href="#"onclick="tuijian(#{channel.id}, -1)">不推荐</a>]
			<#else>
				[<a href="#"onclick="tuijian(#{channel.id}, 0)">推荐</a>]
			</#if>