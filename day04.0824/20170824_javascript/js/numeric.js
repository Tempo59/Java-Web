var width = 10;
var height = 'A3.5';
//isNaN:判断是否非数字
document.write(isNaN('a') + "<br/>");
var pi = 3.1415926;
//toFixed(len):len代表长度【以字符串的形式返回四舍五入到指定长度】
var ret = pi.toFixed(3);
alert(ret);
alert(typeof ret);//typeof(ret)
//toExponential():以字符串形式返回科学计数法（指数计数）
alert(pi.toExponential());
alert(pi.toPrecision());

//执行算术运算会自动进行类型转换
alert(width * height);
alert(width + parseFloat(height));

var condition = 'false';
if(condition){
	alert('nbsp');
}

var age;//声明变量，但是没有给变量赋值===undefined
alert(age);
if(age){
	alert('======undefinded');
}

alert(gender);
