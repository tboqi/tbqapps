<?php echo appindex::navigation(array('welcome/index' => '首页')); ?>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td width="5">&nbsp;</td>
    <td width="180" valign="top">
    	<?php echo new View('user/blocks/appindex_user_center'); ?>      
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
      </table>
      <?php echo article_block::new_articles();?>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
      </table>
      <?php echo user_block::online_users(10); ?>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
      </table>
      </td>
    <td width="8">&nbsp;</td>
    <td valign="top">
    	<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" class="MAINBORDER">
        <tr>
          <form method=post name=form action="#" target="_blank">
            <td width="95"><p><img src="<?php echo url::base(); ?>images/ss1.gif" width="25" height="19" align="texttop"> 站内搜索：</p></td>
            <td><input name="keyword" type="text" size="28" onblur="if (value ==''){value='请输入关键字'}" onmouseover=this.focus() onfocus=this.select() onclick="if(this.value=='请输入关键字')this.value=''" value="请输入关键字">
                <input name="action" type="radio" value="soft" checked>
        软件 
        <input type="radio" name="action" value="info">
        文章
        <input type="radio" name="action" value="web">
        网站 </td>
            <td width="70"><input name="imageField" type="image" src="<?php echo url::base(); ?>images/search.gif" align="middle" width="65" height="20" border="0"></td>
          </form>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
      </table>
      <?php echo user_block::active_users(4); ?>
      <?php echo user_block::new_users(4); ?>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="275" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#E4E4E4">
              <tr>
                <td height="26" background="<?php echo url::base(); ?>images/main_282.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td>栏目设置</td>
                      <td width="50"><a href="#" class="lianjie_2"><img src="<?php echo url::base(); ?>images/more.gif" width="37" height="16" border="0" ></a></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="150" bgcolor="#FFFFFF">&nbsp;</td>
              </tr>
          </table></td>
          <td width="8">&nbsp;</td>
          <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#E4E4E4">
              <tr>
                <td height="26" background="<?php echo url::base(); ?>images/main_282.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td>栏目设置</td>
                      <td width="50"><a href="#" class="lianjie_2"><img src="<?php echo url::base(); ?>images/more.gif" width="37" height="16" border="0" ></a></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="150" bgcolor="#FFFFFF">&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
      </table></td>
    <td width="5">&nbsp;</td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" bgcolor="#CCCCCC"></td>
      </tr>
      <tr>
        <td height="50"><div align="center">文字连接</div></td>
      </tr>
      <tr>
        <td height="10" background="<?php echo url::base(); ?>images/dian_2.gif"></td>
      </tr>
    </table></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>