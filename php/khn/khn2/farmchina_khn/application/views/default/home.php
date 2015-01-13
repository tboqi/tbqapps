<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="180" valign="top">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td height="30" align="center" background="<?php echo url::base(); ?>/images/left01_top.jpg" 
	        class="STYLE1">活动区域</td>
	      </tr>
	      <tr>
	        <td height="170">&nbsp;</td>
	      </tr>
	    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" background="<?php echo url::base(); ?>/images/left01_top.jpg" 
          align="center"><strong>会员中心</strong></td>
        </tr>
        <tr>
          <td height="76" valign="top" id="userLogin">
          <?php echo $menu; ?>
          </td>
        </tr>
        <tr>
          <td height="13" valign="top"><img src="<?php echo url::base(); ?>/images/left01_under.jpg" 
          width="180" height="13" /></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="center" background="<?php echo url::base(); ?>/images/left_05.jpg">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="67%" align="right">
              <a href="<?php echo url::site("article/findByCategory/1"); ?>" target="_blank"><strong>无公害技术</strong></a>
              </td>
              <td width="33%" align="right"><a href="<?php echo url::site("article/findByCategory/1"); ?>" target="_blank">more</a></td>
            </tr>
          </table></td>
        </tr>
        <?php if($articlesWghjs) { foreach ($articlesWghjs as $article) { ?>
        <tr>
          <td height="24">
          	<img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" />
          	<a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 22); ?></a>
          	<?php if(time() - $article->create_time <= 60 * 60 * 24) { ?>
          	<img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" />
          	<?php } ?>
          </td>
        </tr>
        <?php } } ?>
      </table></td>
    <td align="center" valign="top"><table width="438" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="32" colspan="2" background="<?php echo url::base(); ?>/images/news.jpg">&nbsp;&nbsp;&nbsp;<strong>最新技术动态</strong></td>
        </tr>
      <tr>
        <td width="144" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <?php foreach ( $articlesZxjsdtImg as $article ) { ?>
          <tr>
            <td height="105" align="center" valign="bottom"><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><img src="<?php echo $article->img; ?>" width="120" height="90" border="0" /></a></td>
          </tr>
          <tr>
            <td height="24" align="center"><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 20); ?></a></td>
          </tr>
          <?php } ?>
        </table></td>
        <td width="295" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <?php foreach ($articlesZxjsdt as $article) { ?>
          <tr>
            <td height="24">&nbsp;&nbsp;[<a href="<?php echo url::site("article/findByCategory/{$article->category_id}"); ?>" target="_blank"><?php echo $article->category_name; ?></a>]<a href="<?php echo url::site("article/detail/{$article->id}"); ?>" title="文章标题：<?php echo $article->title; ?>" alt="文章标题：<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 16); ?></a>?(<?php echo date("Y年m月d日", $article->create_time); ?>)</td>
          </tr>
          <?php } ?>
        </table></td>
      </tr>
    </table>
      <table width="438" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="31" colspan="2" align="center" background="<?php echo url::base(); ?>/images/top03.jpg"><table width="94%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><strong>供求信息</strong></td>
              <td align="right"><a href="<?php echo url::site("article/findByCategory/5"); ?>" target="_blank">more</a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
        <?php if($articlesGqxx && is_array($articlesGqxx) && count($articlesGqxx) > 0) { 
        foreach ($articlesGqxx as $key => $article) { ?>
        <td width="50%" height="24">◎ <a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 40); ?></a></td>
        <?php if($key % 2 == 1) { ?></tr><tr><?php } ?>
        <?php } } ?></tr>
      </table></td>
    <td width="172" valign="top"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#cbcbcb">
      <tr>
        <td height="28" align="center" background="<?php echo url::base(); ?>/images/right_top.jpg"><a href="<?php echo url::site("article/findByCategory/9"); ?>" target="_blank"><strong>温室种植</strong></a></td>
      </tr>
      <tr><td height="480" align="right" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0">
          <?php if($articlesWszz) { foreach ($articlesWszz as $article) { ?>
          <tr>
            <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /> <a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 16); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
          </tr>
          <?php } } ?>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="180" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/left_03.jpg"><a href="<?php echo url::site("article/findByCategory/2"); ?>" target="_blank"><strong>农业标准</strong></a></td>
      </tr>
      <?php if($articlesNybz) { foreach ($articlesNybz as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 22); ?></a> <?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php } } ?>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/left02_top.jpg"><a href="<?php echo url::site("article/findByCategory/3"); ?>" target="_blank"><strong>农业词典</strong></a></td>
      </tr>
      <?php if($articlesNycd) { foreach ($articlesNycd as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" />
        	<a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 22); ?></a>
          <?php if(time() - $article->create_time <= 60 * 60 * 24) { ?>
          <img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" />
          <?php } ?>
        </td>
      </tr>
      <?php } } ?>
    </table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/left_04.gif"><a href="<?php echo url::site("article/findByCategory/4"); ?>" target="_blank"><strong>蔬菜技术</strong></a></td>
      </tr>
      <?php if($articlesScjs) { foreach ($articlesScjs as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" />
        	<a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 22); ?></a>
          <?php if(time() - $article->create_time <= 60 * 60 * 24) { ?>
          <img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" />
          <?php } ?>
        </td>
      </tr>
      <?php } } ?>
    </table>
	</td>
    <td align="center" valign="top"><table width="438" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31" colspan="2" align="center" background="<?php echo url::base(); ?>/images/top02.jpg"><table width="94%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><strong>蔬菜种植技术</strong></td>
              <td align="right"><a href="<?php echo url::site("article/findByCategory/6"); ?>" target="_blank">more</a></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td width="67%" height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <?php if($articlesSczzjs) { foreach ($articlesSczzjs as $article) { ?>
          <tr>
            <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /> <a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 28); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
          </tr>
          <?php } } ?>
        </table></td>
        <td width="33%">
        <?php if($articlesSczzjsImg) { ?>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        	<?php foreach ($articlesSczzjsImg as $article) { ?>
          <tr>
            <td><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><img src="<?php echo $article->img; ?>" width="120" height="90" border="0" /></a></td>
          </tr>
          <tr>
            <td align="center"><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 20); ?></a></td>
          </tr>
          <?php } ?>
        </table>
        <?php } ?>
        </td>
      </tr>

    </table>
      <table width="438" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="31" colspan="2" align="center" background="<?php echo url::base(); ?>/images/top04.jpg"><table width="94%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><strong>昆虫养殖</strong></td>
                <td align="right"><a href="<?php echo url::site("article/findByCategory/7"); ?>" target="_blank">more</a></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="67%" height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <?php if($articlesKcyz) { foreach ($articlesKcyz as $article) { ?>
	          <tr>
	            <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /> <a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 28); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
	          </tr>
	          <?php } } ?>
          </table></td>
          <td width="33%">
	        <?php if($articlesKcyzImg) { ?>
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	        	<?php foreach ($articlesKcyzImg as $article) { ?>
	          <tr>
	            <td><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><img src="<?php echo $article->img; ?>" width="120" height="90" border="0" /></a></td>
	          </tr>
	          <tr>
	            <td align="center"><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 20); ?></a></td>
	          </tr>
	          <?php } ?>
	        </table>
	        <?php } ?>
	        </td>
        </tr>
      </table>
      <table width="438" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="31" colspan="2" align="center" background="<?php echo url::base(); ?>/images/top03.jpg"><table width="94%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><strong>致富项目</strong></td>
                <td align="right"><a href="<?php echo url::site("article/findByCategory/8"); ?>" target="_blank">more</a></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="67%" height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <?php if($articlesZfxm) { foreach ($articlesZfxm as $article) { ?>
	          <tr>
	            <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /> <a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 28); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
	          </tr>
	          <?php } } ?>
          </table></td>
          <td width="33%">
	        <?php if($articlesZfxmImg) { ?>
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	        	<?php foreach ($articlesZfxmImg as $article) { ?>
	          <tr>
	            <td><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><img src="<?php echo $article->img; ?>" width="120" height="90" border="0" /></a></td>
	          </tr>
	          <tr>
	            <td align="center"><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 20); ?></a></td>
	          </tr>
	          <?php } ?>
	        </table>
	        <?php } ?>
	        </td>
        </tr>
      </table></td>
    <td width="172" valign="top"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#cbcbcb">
      <tr>
        <td height="28" align="center" background="<?php echo url::base(); ?>/images/right_03.jpg"><a href="<?php echo url::site("article/findByCategory/10"); ?>" target="_blank"><strong>种业信息</strong></a></td>
      </tr>
      <tr>
        <td align="right" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0">
          <?php if($articlesZyxx) { foreach ($articlesZyxx as $article) { ?>
          <tr>
            <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /> <a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 28); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
          </tr>
          <?php } } ?>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#cbcbcb">
        <tr>
          <td height="28" align="center" background="<?php echo url::base(); ?>/images/right_02.jpg"><a href="<?php echo url::site("article/findByCategory/11"); ?>" target="_blank"><strong>市场行情</strong></a></td>
        </tr>
        <tr>
          <td align="right" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0">
            <?php if($articlesSchq) { foreach ($articlesSchq as $article) { ?>
	          <tr>
	            <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /> <a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"><?php echo StringUtil::showtitle($article->title, 28); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
	          </tr>
	          <?php } } ?>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FCFFE4">
  <tr>
    <td valign="top" width="25%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top5.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="<?php echo url::site("article/findByCategory/12"); ?>" target="_blank"><strong>保 鲜</strong></a></td>
            <td align="right"><a href="<?php echo url::site("article/findByCategory/12"); ?>" target="_blank">more</a></td>
          </tr>
        </table></td>
      </tr>
      <?php if($articlesBx) { foreach ($articlesBx as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
    <td valign="top" width="25%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top5.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><a href="<?php echo url::site("article/findByCategory/13"); ?>" target="_blank"><strong>果 树</strong></a></td>
              <td align="right"><a href="<?php echo url::site("article/findByCategory/13"); ?>" target="_blank">more</a></td>
            </tr>
        </table></td>
      </tr>
      <?php if($articlesGs) { foreach ($articlesGs as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
    <td valign="top" width="25%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top5.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><a href="<?php echo url::site("article/findByCategory/14"); ?>" target="_blank"><strong>畜 牧</strong></a></td>
              <td align="right"><a href="<?php echo url::site("article/findByCategory/14"); ?>" target="_blank">more</a></td>
            </tr>
        </table></td>
      </tr>
      <?php if($articlesXm) { foreach ($articlesXm as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
    <td valign="top" width="25%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top5.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><a href="<?php echo url::site("article/findByCategory/15"); ?>" target="_blank"><strong>无 公 害</strong></a></td>
              <td align="right"><a href="<?php echo url::site("article/findByCategory/15"); ?>" target="_blank">more</a></td>
            </tr>
        </table></td>
      </tr>
      <?php if($articlesWgh) { foreach ($articlesWgh as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
  </tr>
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FCFFE4">
  <tr>
    <td width="25%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top021.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="<?php echo url::site("article/findByCategory/16"); ?>" target="_blank"><strong>昆 虫 图 谱</strong></a></td>
            <td align="right"><a href="<?php echo url::site("article/findByCategory/16"); ?>" target="_blank">more</a></td>
          </tr>
        </table></td>
      </tr>
      <?php if($articlesKctp) { foreach ($articlesKctp as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
    <td valign="top" width="25%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top021.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="<?php echo url::site("article/findByCategory/17"); ?>" target="_blank"><strong>农 机</strong></a></td>
            <td align="right"><a href="<?php echo url::site("article/findByCategory/17"); ?>" target="_blank">more</a></td>
          </tr>
        </table></td>
      </tr>
      <?php if($articlesNj) { foreach ($articlesNj as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
    <td valign="top" width="25%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top021.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="<?php echo url::site("article/findByCategory/18"); ?>" target="_blank"><strong>农 药</strong></a></td>
            <td align="right"><a href="<?php echo url::site("article/findByCategory/18"); ?>" target="_blank">more</a></td>
          </tr>
        </table></td>
      </tr>
      <?php if($articlesNy) { foreach ($articlesNy as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
    <td valign="top" width="25%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" background="<?php echo url::base(); ?>/images/top021.gif"><table width="90%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="<?php echo url::site("article/findByCategory/19"); ?>" target="_blank"><strong>食 用 菌</strong></a></td>
            <td align="right"><a href="<?php echo url::site("article/findByCategory/19"); ?>" target="_blank">more</a></td>
          </tr>
        </table></td>
      </tr>
      <?php if($articlesSyj) { foreach ($articlesSyj as $article) { ?>
      <tr>
        <td height="24"><img src="<?php echo url::base(); ?>/images/article_common.gif" width="9" height="15" /><a href="<?php echo url::site('article/detail/' . $article->id); ?>" title="<?php echo $article->title; ?>" alt="<?php echo $article->title; ?>" target="_blank"> <?php echo StringUtil::showtitle($article->title, 24); ?></a><?php if(time() - $article->create_time <= 60 * 60 * 24) { ?><img src="<?php echo url::base(); ?>/images/hot.gif" width="26" height="10" /><?php } ?></td>
      </tr>
      <?php }} ?>
    </table></td>
  </tr>
</table>