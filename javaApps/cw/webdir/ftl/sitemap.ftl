<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<a href="/sitemap.action?flag=article">文章相关</a>　　　　　　　　　<a href="/sitemap.action?flag=channel">频道相关</a>　　　　　　　　　<a href="/sitemap.action?flag=tag">tag相关</a>　　　　　　　　　<a href="/sitemap.action?flag=user">用户相关</a>　　　　　　　　　<a href="/sitemap.action?flag=all">全部</a>　　　　
<xml>
<#if articleList?exists>
	<#list articleList as a>
     <url>
    	<loc>http://www.chuanwen.com.cn/r/#{a.id}</loc>
        <lastmod>${datetime}</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.8</priority>
     </url>
	</#list>
	
</#if>
<#if channelList?exists>
	<#list channelList as c>
     <url>
    	<loc>http://www.chuanwen.com.cn/c/#{c.id}</loc>
        <lastmod>${datetime}</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.8</priority>
     </url>
	</#list>
</#if>　　
<#if labelList?exists>
	<#list labelList as l>
     <url>
    	<loc>http://www.chuanwen.com.cn/search/search?qs=${stack.findValue("@com.cc.cw.util.URLCoderUtil@encode('${l.content}','UTF-8')")}&search=all&pn=1</loc>
        <lastmod>${datetime}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.8</priority>
     </url>
	</#list>
</#if>
<#if memberlList?exists>
	<#list memberlList as m>
     <url>
    	<loc>http://www.chuanwen.com.cn/user/viewuser?memberId=#{m.id}</loc>
        <lastmod>${datetime}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.8</priority>
     </url>
	</#list>
</#if>　　　　　　
</xml>　　　
</body>
</html>