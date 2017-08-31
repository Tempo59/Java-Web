function checkUsername(ele){
	var value = ele.value;
	if(value.length < 5){
		var msg = document.getElementById('feedback');
		//msg.textContent = '<font color="red">字符长度必须大于5位</font>';
		msg.innerHTML = '<font color="red">字符长度必须大于5位</font>';
	}
}
