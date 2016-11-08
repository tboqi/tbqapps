<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<link href="<?php echo CSS_PATH;?>vote.css" rel="stylesheet" type="text/css" />
<!--main-->
<div class="main tps">
<div class="crumbs"><a href="<?php echo siteurl($siteid);?>">首页</a><span> &gt; </span> <a href="<?php echo APP_PATH;?>index.php?m=vote&c=index&a=lists&siteid=<?php echo $siteid;?>">投票</a>  </div>
<form name="myform" id="myform"  action="<?php echo APP_PATH;?>index.php?m=vote&c=index&a=post&subjectid=<?php echo $subjectid;?>&siteid=<?php echo $siteid;?>" method="post">
<div class="vote_result">
    	<div class="tit"><span class="r">总票数：<strong><?php echo $vote_data['total'];?></strong></span><h5>标题: <?php echo $subject;?></h5></div>
        <div class="c_box wrap">
		<input type="hidden" name="subjectid" value="<?php echo $subjectid;?>">
        <table width="100%" border="1" cellspacing="0" cellpadding="0" class="tp">
       	<?php $n=1;if(is_array($options)) foreach($options AS $r) { ?>
       	<?php $i++; ?>
             <tr>
             	<th><?php echo $i;?></th>
               <td class="tp_tit"><input type=<?php if($ischeckbox=='0') { ?>"radio"<?php } else { ?>"checkbox"<?php } ?> name="radio[]" id="radio" value="<?php echo $r['optionid'];?>" <?php echo $check_status;?> /></td>
               <td class="ls"><?php echo $r['option'];?></td>
               <td class="tdcol3"><font color=red><?php echo $vote_data[$r['optionid']]==''? 0:$vote_data[$r['optionid']]?></font> 票</td>
             </tr>
        <?php $n++;}unset($n); ?> 
        </table>
        
        </div>
    </div>
    <div class="shuru_btn"><button class="tp_btn" type="submit" style="<?php echo $display;?>"></button><a href="<?php echo APP_PATH;?>index.php?m=vote&c=index&a=result&subjectid=<?php echo $subjectid;?>&siteid=<?php echo $siteid;?>">[查看投票结果] </a></div>
    </form>
    <div class="vote_listt">
    	<div class="tit"><span class="r"><a href="<?php echo APP_PATH;?>index.php?m=vote&c=index&a=lists&siteid=<?php echo $siteid;?>">查看更多>></a></span><h5>其他投票</h5></div>
        <ul class="wrap licol2 icon3j">
             <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"vote\" data=\"op=vote&tag_md5=1256e6de5989d66c616008706a048b01&action=other_vote&num=8&order=subjectid+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">修改</a>";}$vote_tag = pc_base::load_app_class("vote_tag", "vote");if (method_exists($vote_tag, 'other_vote')) {$data = $vote_tag->other_vote(array('order'=>'subjectid DESC','limit'=>'8',));}?>
			 	<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
				
				 <li><a title="<?php echo $r['subject'];?>" href="<?php echo APP_PATH;?>index.php?m=vote&c=index&a=show&show_type=1&subjectid=<?php echo $r['subjectid'];?>"><?php echo $r['subject'];?></a><span ><font color="#1E50A0">(得票数: <?php echo $r['votenumber'];?>)</font></span></li>
				<?php $n++;}unset($n); ?>
			 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
       
        </ul>
    </div>
</div>
<?php include template("content","footer"); ?>
