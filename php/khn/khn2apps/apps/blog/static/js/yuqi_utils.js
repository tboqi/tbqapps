function deleteRow(url) {
	if (confirm("真的要删除吗？")) {
		$.get(url, function(data) {
			location.reload(true);
		});
	}
	return false;
}

function form_submit(formid) {
	$('#' + formid).ajaxForm( {
		dataType :'json',
		beforeSubmit :beforeSubmit,
		success :processJson
	});
}

function form_submit_fck(formid) {
	$('#' + formid).ajaxForm( {
		dataType :'json',
		beforeSubmit :beforeSubmitFCK,
		success :processJson
	});
}

function beforeSubmit(formData, jqForm, options) {
	$b = $(":submit");
	$b[0].disabled = true;
	$b[0].value = "保存中...";
}

function beforeSubmitFCK(formData, jqForm, options) {
	var oEditor = FCKeditorAPI.GetInstance("content");
	$.each(formData, function(i, n) {
		if(n.name == 'content') {
			n.value = oEditor.GetXHTML(true);
		}
	});
	$b = $(":submit");
	$b[0].disabled = true;
	$b[0].value = "保存中...";
}

function processJson(data) {
	if (data.status == 1) {
		alert("添加成功");
		//location.reload(true);
		location.href = data.url;
	} else {
		$.each(data.errors, function(i, n) {
			$(':input#' + i).after('<span>' + n + '</span>');
		});
		$b = $(":submit");
		$b[0].disabled = false;
		$b[0].value = "保存";
	}
}