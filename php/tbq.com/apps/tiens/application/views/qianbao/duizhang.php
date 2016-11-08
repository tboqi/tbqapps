<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>表单插件</title>
<link href="http://tbq_static.com/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="http://tbq_static.com/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
<script src="http://tbq_static.com/ligerui/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="http://tbq_static.com/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="http://tbq_static.com/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js"></script>
<script src="http://tbq_static.com/ligerui/lib/ligerUI/js/plugins/ligerCheckBoxList.js"></script>
<script src="http://tbq_static.com/ligerui/lib/ligerUI/js/plugins/ligerRadioList.js"></script>
<script src="http://tbq_static.com/ligerui/lib/ligerUI/js/plugins/ligerListBox.js"></script>


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
    <ul>
        <li>日期跨度限制为31天</li>
    </ul>
    <form id="form1" method="get" action="http://ewm.tiens.com/vipcard/trade/accountFile.do" >
    <table>
		<tr>
			<td><label>交易开始日期：</label></td>
			<td><input value="2016-07-01" type="text" size="30" name="startDate" class="ui-textbox" /></td>
		</tr>
		<tr>
			<td><label>结束日期：</label></td>
			<td><input value="2016-07-31" type="text" size="30" name="endDate" class="ui-textbox" /></td>
		</tr>
		<tr>
			<td><label>报表类型：</label></td>
			<td><select name="transType">
				<option value="1">1-出账报表</option>
				<option value="2" selected>入账报表</option>
			</select></td>
		</tr>
		<tr>
			<td><label>商户号：</label></td>
			<td><input type="text" name="merchNo" class="ui-textbox" value="000000000000001" /></td>
		</tr>
		<tr>
			<td><label>机构号：</label></td>
			<td><input type="text" name="organNo" class="ui-textbox" value="0000000001" /></td>
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
