<div class="pageContent">
	<form method="post" action="<?php echo URL::site('tools/json2arr');?>" class="pageForm" onsubmit="return validateCallback(this, 'showDataAjaxDone');">
		<div class="pageFormContent" layoutH="56">
            <dl class="nowrap">
                <dt>json：</dt>
                <dd><textarea name="jsonstr" cols="80" rows="2"></textarea></dd>
            </dl>
		</div>
		<div class="formBar">
			<ul>
                <li><div class="button"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
    </form>
</div>
