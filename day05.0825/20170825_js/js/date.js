
//console.dir(date);
//document.write(date + "<br/>");
//document.write("date.getDay():返回一周中的第几天:" +　date.getDay() + "<br/>");
//document.write("date.getFullYear():" + date.getFullYear() + "<br/>");
window.status="看看状态栏中的文字变化了吗？";

function showDate(){
	show();
	id = setInterval(show,1000);
}
function show(){
	var date=new Date();
	var year=date.getFullYear();
//	alert(date.toDateString());
//	alert(date.toLocaleDateString());
   	var month=date.getMonth();
   	var day=date.getDate();
   	var week=date.getDay();
   	var hour=date.getHours();
   	var mimutes=date.getMinutes();
   	var seconds=date.getSeconds();
   	var tim=date.getTime();
   	var span = document.getElementById("date");
   	msg = date.toLocaleString();
   	span.textContent=msg;
}

function clearDate(){
	clearInterval(id);
}

function test(){
	alert(12);
	
}
function test1(){
	setTimeout(test,2000);
}
/**
 * BOM
 * DOM
 * EVENT
 */
