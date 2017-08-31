function popWin(){
	window.open('../typelist.html','new','top=100,left=100,width=300,height=200');
}
function closeWindow(){
	/**
	 * 1.关闭窗口
	 * 2.将选择的单选按钮的值填写进父窗口的input元素中
	 */
	//1.得到打开本窗口的父窗口
	var parent = window.opener;
	if(parent){
		var value = document.forms[0].type1.value;
		alert(value);
		parent.document.forms[0].grade.value = value;
	}
	window.close();//关闭窗口
}

function sure(){
	return window.confirm('真的删除吗');
}

function leval(){
	var ret = prompt('请对我们的服务做出评价，1-5','5');
	switch(ret){
		case "1":
			alert('严重不满意');
			break;
		default:
			alert(请输入正确的数字);
	}
}
