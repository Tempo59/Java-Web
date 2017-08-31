/**
 * 声明函数
 */
demo();//声明式函数可以在声明之前调用

function demo(){
	var width = 20;
	var height = 30;
	alert(width * height);
}
function getArea(width,height){
	return width * height;
}
/**
 * 匿名函数
 */

var area = function(index){
	alert(index);
}
area('hehe');

/**
 * arguments
 * 计算不定加数的和
 */
function getSum(){
	var sum = 0;//undefined
	for(var i in arguments){
		sum += arguments[i];
	}
	return sum;
}
alert(getSum(1,2.3,5.5,78,29));
/**
 * 全局变量：声明在函数及对象之外的变量（window）
 * 		在函数内部没有使用var声明的变量【内存占用时间长，很容易引起命名冲突】
 * 
 */
function test(){
	alert(msg);//var msg;
	var msg = '';
}

/**
 * 声明立即执行表达式
 * 用途：
 * 		立即执行且执行一次
 * 		可以将执行结果作为参数进行传递
 */
function increment(num){
	return num * 2;
}

var sum = (function(){
	//省略1万行，得到了这样一个结果
	return 5;
}());
alert(increment((function(){
	//省略1万行，得到了这样一个结果
	return 10;
}())));