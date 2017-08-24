/**
 * 全局
 * 没有使用var声明的变量是按照全局变量来处理（严格的禁止），会导致命名冲突
 * 在function外声明的都是全局变量
 * 局部变量
 */
var msg = "全局变量";
function test(){//变量提升：会将所有的声明都会提到当前环境的最开始
	alert(msg);
	var msg = "局部变量";
	
	msg = "123";
	alert(msg);
}
test();
alert(msg);

function test1(){
	message = "Hello World";
	alert(message);
}
test1();

function test2(){
	alert(message);
}
test2();
