/**
 * 声明函数及返回单个值
 */
function area(){
	var width = 100;
	var height = 10;
	var area = width * height;
	return area;
}
var area = area();
alert(area);

alert(getArea(10,2,30));

/**
 * 计算圆柱体的面积及体积
 * @param {Object} width 长度
 * @param {Object} heigth 宽度
 * @param {Object} dept 高度
 * 
 * 接收信息（形参）及返回多个数据
 */
function getArea(width,height,dept){
	var area = width * height;
	var volume = area * dept;
	return [area,volume];
}

var ret = getArea(2,3,6);
alert(ret);

/**
 * 函数声明，匿名函数
 * @param {Object} width
 * @param {Object} height
 * @param {Object} dept
 */
var volume = function(width,height,dept){
	var area = width * height;
	var volume = area * dept;
	return [area,volume];
}
alert(volume(2,3,4));

//立即调用函数表达式
var area1 = (function(width,height,dept){
	//var width = 2,height=4,dept=6;
	var area = width * height;
	var volume = area * dept;
	return [area,volume];
}(2,4,6));//()声明函数后立即，而且只执行一次【】
alert(area1);

/**
 * 函数可变参数
 * 参数对象
 */
function sum(num1,num2){
	return num1 + num2;
}
 //alert(sum(20,30,30));
 
function getSum(){
 	var sum = 0;
 	for(var i = 0; i < arguments.length; i++){
 		sum += arguments[i];
 	}
 	return sum;
 }
var ret2 = getSum(10,20,30,50);
alert(ret2);
