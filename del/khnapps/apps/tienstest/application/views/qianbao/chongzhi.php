<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>表单插件</title>
<link href="http://tbq_ligerui.com/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="http://tbq_ligerui.com/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
<script src="http://tbq_ligerui.com/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="http://tbq_ligerui.com/lib/ligerUI/js/ligerui.all.js"></script>
<script src="http://tbq_ligerui.com/lib/ligerUI/js/plugins/ligerComboBox.js"></script>
<script src="http://tbq_ligerui.com/lib/ligerUI/js/plugins/ligerCheckBoxList.js"></script>
<script src="http://tbq_ligerui.com/lib/ligerUI/js/plugins/ligerRadioList.js"></script>
<script src="http://tbq_ligerui.com/lib/ligerUI/js/plugins/ligerListBox.js"></script>


    <script type="text/javascript">
$(function ()
        {
        $("#form1").ligerForm();
        });


</script>
<style type="text/css">
body
{
    padding-left:10px;
    font-size:13px;
}
h1
{
    font-size:20px;
    font-family:Verdana;
}
h4
{
    font-size:16px;
    margin-top:25px;
    margin-bottom:10px;
}

.description
{
    padding-bottom:30px;
    font-family:Verdana;
}
.description h3
{
color:#CC0000;
      font-size:16px;
margin:0 30px 10px 0px;
padding:45px 0 8px;
        border-bottom:solid 1px #888;
}
td {
padding: 5px;
}

</style>

</head>

<body style="padding:10px">
    <form id="form1" method="post" action="<?php echo URL::site('qianbao/do_chongzhi');?>" >
    <h2>head</h2>
    <table>
        <tr>
		    <td><label for="version">版本：</label></td>
			<td><input class="ui-textbox" name="head[version]" type="text" size="30" value="100"/></td>
        </tr>
		<tr>
            <td><label>安全模式：</label></td>
			<td><input class="ui-textbox" name="head[security]" type="text" size="30" value="md5" /></td>
		</tr>
		<tr>
			<td><label>接口类型：</label></td>
            <td><input name="head[transtype]" class="ui-textbox" type="text" size="30" value="4009" /></td>
		</tr>
		<tr>
			<td><label>客户端时间戳：</label>
			<td><input type="text" value="<?php echo date('YmdHis');?>" class="ui-textbox" name="head[dtclient]"/></td>
		</tr>
		<tr>
			<td><label>渠道类型：</label></td>
			<td><select name="head[channeltype]">
				<option value="1">1 - callcenter</option>
				<option value="2" selected>2 - B2C</option>
				<option value="3">3 - B2B</option>
				<option value="4">4 - 客户端</option>
				<option value="5">5 - B2C手机</option>
				<option value="6">6 - 一元夺宝</option>
				<option value="7">7 - 财务后台</option>
			</select></td>
		</tr>
    </table>
    <h2>body</h2>
    <table>
		<tr>
			<td><label>key：</label>
			<td><input type="text" value="4d2e92068ffb8f6aacfa5ed7fbc939d6" class="ui-textbox" name="key"/></td>
		</tr>
		<tr>
			<td><label>交易序号：</label></td>
			<td><input type="text" size="30" name="body[transid]" class="ui-textbox" /></td>
		</tr>
		<tr>
			<td><label>钱包号：</label></td>
			<td><input type="text" name="body[walletid]"size="30" class="ui-textbox" /></td>
		</tr>
		<tr>
			<td><label>充值金额：</label></td>
			<td><input type="text" name="body[amount]" size="30" class="ui-textbox" /></td>
		</tr>
		<tr>
			<td><label>商户号：</label></td>
			<td><input value="000000000000001" type="text" name="body[merchno]" size="30" class="ui-textbox" /></td>
		</tr>
		<tr>
			<td><label>机构号：</label></td>
			<td><input value="0000000001" type="text" name="body[organno]" size="30" class="ui-textbox" /></td>
		</tr>
		<tr>
			<td><label>备注：</label></td>
			<td><textarea class="ui-textarea" name="body[remark]" cols="80" rows="2"></textarea></td>
		</tr>
	    <tr>
            <td> </td>
            <td><input type="submit" value="保存"></td>
	    </tr>
	</table>
	</form>
</div>
<script type="text/javascript">
function getData()
{
    var form = new liger.get("form1");
    var data = form.getData();
    alert(JSON.stringify(data));
}

function submitForm(){
    var data = {};
    $("input,select,textarea").each(function (){
        var name = $(this).attr("name");
        if (name && name.indexOf('ligerui') == -1)
        {
            data[name] = this.value;
        }
    });
    alert(JSON.stringify(data));
}
</script>
