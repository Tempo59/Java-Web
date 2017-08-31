//存放随机出现的字符
var codes = [];
for(var i = 'a'.charCodeAt(0); i < 'z'.charCodeAt(0);i++){
	codes.push(String.fromCharCode(i));
}
setInterval(function(){
	var index = Math.random() * 25 + 1;//返回0到1之间的随机数
	index = Math.floor(index);//向下取整
	document.write(codes[index]);
},1000);
