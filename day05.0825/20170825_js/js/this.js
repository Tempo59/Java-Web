/**
 * this关键字
 * 
 */
//1.局部作用域function
/**
 * 当前函数既不在其他对象内部也不在其他函数内，位于全局作用域
 * this代表Window对象
 */
function windowSize(){
	console.dir(this);
	var width = this.innerWidth;
	var height = this.innerHeight;
	return [width,height];
}
var windowSize = windowSize();
document.write("当前窗口的宽度为：" + windowSize[0] +　",当前窗口的高度为:"　+ windowSize[1] + "<br/>");
/**
 * this===2.全局变量
 * 所有的全局变量都作为window对象的属性
 */
var width = 600;
var shape = {width : 300};
var showWidth = function(){
	document.writeln(this.width);
}
showWidth();
/**
 * 对象的方法,this指向调用该方法的对象
 */
var wall = {
	width:400,
	height:300,
	getArea : function(){
		console.dir(this);
		return this.width * this.height;
	}
};
var area = wall.getArea();
document.writeln(area);

var wall1 = {
	width:40,
	height:30,
	getArea : function(){
		console.dir(this);
		return this.width * this.height;
	}
};
/**
 * 表达式作为方法
 */
var width1 = 100;
var wall2 = {width1:200};
var showWidth1 = function(){
	document.writeln(this.width1);
}
//给对象添加方法
wall2.getWidth = showWidth1;
wall2.getWidth();
