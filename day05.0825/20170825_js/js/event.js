function eventDemo(){
	var ele = document.getElementById('username');
	ele.addEventListener('click',function(event){
		console.dir(event);
		alert(666)
	},false);
}

window.onload = changeElementDefaultActive;


function changeElementDefaultActive(){
	var a = document.getElementById('demo');
	a.addEventListener('click',function(event){
		event.preventDefault();
	},false);
}
