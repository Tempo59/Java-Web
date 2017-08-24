/*var name = '张三丰';
var num1 = 10;
var num2 = 0;

if(num1 > 0){
	alert(666);
}

if(name = '金毛狮王'){//在js中，字符串只要不为空串，条件运算为true
	alert('balana');
}
name = '';
if(name){
	alert('我是一个空串');
}

if(num1 == num2){
	alert('num1 == num2');
}

if(num2){
	alert(num1);
}
num2 = -1;

if(num2){//数组类型，非0为true，0为false,NaN为false
	alert(num1+ "==");
}
document.write(typeof(1 / 0));
name = '还是中文吧';
alert(name);
var ret = num1 * name;//NaN not a number
document.write(typeof(ret));
alert(ret);
if(1 / 0)alert(123);
document.write('<br/>');
if(ret){
	document.write('NaN在条件运算中为true');
}else{
	document.write('NaN在条件运算中为false');
}*/
var name = '张翠山';
var num1 = 0,num2 = 10;
var ret = name && num2;//true
if(ret){
	document.write('逻辑与：' + ret);
}
ret = name || 'hello' || num1 || 0;
if(ret){
	document.write('逻辑与：' + ret);
}

//&&:参与多个运算同时满足为true，逻辑或同理
/**
 * 返回的是第一次短路运算后的值
 */
document.write(ret);

//条件运算符