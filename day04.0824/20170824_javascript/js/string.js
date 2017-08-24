/**
 * 只要被''或者双引号引起来的内容都是字符串
 */
var message = "home sweet home";
//length属性：返回字符串的长度 HTML
var length = message.length;
if(length < 4 || length > 20){
	document.write("长度不满足要求。。。。");
}
//charAt(index):返回指定索引的字符
alert(message.charAt(0));
var chars = new Array();
for(var i = 'a'.charCodeAt(0); i <= 'z'.charCodeAt(0);i++){
	//push()向数组中添加一个元素
	//i代表当前字符的asc2码，String.fromCharCode(i)表示将asc2码转成对应的字符
	chars.push(String.fromCharCode(i));
}
alert(chars);
//indexOf(str):返回子串在字符串中的位置
var email = "1020zhaodan@163.com";
var index = email.indexOf('com');
alert(index);
if(index < 0){
	document.write("邮件格式不满足要求");
}
//验证电子邮件
/**
 * 1020zhaodan@163.com
 * 1020zhaodan A部分
 * 163 B部分
 * com C部分
 * A部分必须长度多少，由什么字符进行
 */
document.write('<br/>');
var a = email.substr(2,10);
document.write("substr():" + a + "<br/>");
var b = email.substring(2,10);
document.write("substring():" + b + "<br/>");

var hotes = message.split(" ");
alert("hotes的长度为:" + hotes.length);

//replace()
var rep = message.replace("me","w");
document.write(message + ".replace('we','w'):" +rep + "<br/>");
document.write(message + ".toLowercase():" +message.toLowerCase() + "<br/>");
document.write(message + ".toUpperCase():" +message.toUpperCase() + "<br/>");

var msg = "  Hello apple  ";
document.write(msg.trim());//
