<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table border="0" cellpadding="0" cellspacing="0" class="top">
  <tr>
    <td valign="bottom">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" class="h_nav"><ul>
        <li><a href="/" id="current">首页</a></li>
        <li><a href="/channellist.html">频道</a></li>
        <li><a href="/tags.html">标签</a></li>
      </ul></td>
    <td align="left" class="h_nav_r"><a href="/rumour/newrumour">发布传闻</a> <a href="/channelapply/channelapply">创建频道</a></td>
    <td align="center" class="zihei">
    <form id="formsearch" name="formearch" action="/search/search?pn=1" method="post">
    <input name="search" type="radio" value="article" checked="checked" />
      文章
          <input type="radio" name="search" value="channel" />
          频道
          <input type="radio" name="search" value="remark" />
          评论
          <input type="text" name="qs" class="textbox2" />
          <input type="image"  value="提交" name="Submit2" src="/pic/images/an01.gif" width="47" height="19" border="0" align="absbottom" /></td>
  </tr>
</table>
</td>
  </tr>
</table>