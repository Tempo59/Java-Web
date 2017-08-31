/**
 *  创建对象====字面量方式
 * 对象：
 *		属性：用变量表示
 * 		方法：用函数表示
 */
var porsche = {
	color : 'red',
	name : '911',
	currentSpeed : 200,
	changeSpeed : function(){
		this.currentSpeed--;
	}
};
alert(typeof porsche);
/**
 * 访问对象成员，可以采用
 * 		1： 点操作符进行成员访问
 * 		2:可以采用['属性名']方式访问
 * 			一般属性名是数字（虽然不推荐，但是可以数字作为属性名称）
 * 			属性名是通过变量的方式进行接收
 * 			
 */
/*alert(porsche.color);
alert(porsche['name']);
var propertyName = 'currentSpeed';
alert(porsche[propertyName]);
porsche.color = 'blue';
alert(porsche.color);*/

var benz = {
	
};
alert(typeof benz);

/**
 * 通过对象的构造方法创建对象,采用new关键字
 */
var hotel = new Object();
hotel.name = '希尔顿大酒店';
hotel.booking = function(){
	alert(this.name);
}
alert(hotel.name);
delete hotel.name;
alert(hotel.name);
hotel.booking();

/**
 * 构造函数方法创建对象
 */
function Car(name,color){
	this.name = name;
	this.color = color;
	
	this.run = function(){
		alert(this.name + "=" + this.color);
	}
}

/*var bmw = new Car('530','黄色');

var benz1 = new Car('S300','黑色');
bmw.run();benz1.run();
*/