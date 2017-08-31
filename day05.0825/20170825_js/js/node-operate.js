function operate(){
	var div = document.createElement('div');
	var text = document.createTextNode('我是一个香蕉');
	div.appendChild(text);
	document.body.appendChild(div);
}
window.onload = operate;

function cloneElement(){
	var span = document.getElementById('letter');
	var letter = span.cloneNode(true);
	letter.style.left = Math.random() * screen.availWidth + 'px';
	document.body.appendChild(letter);
	//document.body.removeChild(span);
}
