/**
 * 定位元素
 * 
 * 单个元素
 * 		document.getElementById(id);
 * 		document.querySelector(css选择器);//返回第一个匹配的元素
 * 多个元素
 * 		document.getElementsByName(name);
 * 		document.getElementsByTagNmae(tag);
 * 		document.querySelectorAll('css选择器');
 * 		document.getElementsByClassName();
 * 元素遍历
 * 		parentNode;//返回父节点
 * 		previousSibling;//得到前一个元素
 * 		nextSibling;//得到后一个元素
 * 		firstChild;//第一个子元素
 * 		lastChild;//最后一个子元素
 */
function $(id){
	return document.getElementById(id);
}

function load(){
	var title = $('title');
	//alert(title);
	var obj = document.querySelector('.con');
	//alert(obj.textContent);
}

function getElements(){
	//var els = document.getElementsByName('username');
	//var els = document.getElementsByTagName('p');
//	var els = document.querySelectorAll('.con');
 	var els = document.getElementsByClassName('con');
	for(var i = 0; i < els.length; i++){
		els[i].className = i % 2 == 0 ? "con2" : "con1";
		/*if(i % 2 == 0){
			els[i].className = 'con2';
		}else{
			els[i].className = 'con1';
		}*/
	}
}

function iter(){
	var ele = $('child').parentNode;
	ele.textContent = 'xxxxxx';
	var ele1 = document.querySelector('.con2');

	alert(ele1.nextSibling);
}
