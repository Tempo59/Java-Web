var code = new Array();
//数组的长度是可变的
code[0] = "#f90";
//alert(code.length);
code[100] = 'blue';
alert(code.length);

//数组声明方式二
var code1 = new Array('张三分',true,10);
alert(code1.length);
var nums = new Array(10,20);
alert(nums.length);
nums = new Array(10);//如果只有一个整数的情况，那么表示数组的长度
alert(nums.length);

//声明数组的简单形式
var names = [];
names[0] = "张三丰";
names[1] = "金毛狮王";
names[2] = "韦一笑";
alert(typeof names);

var names1 = ['','',''];
document.write(names.join('-') + '<br/>');
alert(names.pop());
alert(names.reverse());
