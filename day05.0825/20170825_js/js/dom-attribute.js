function operateAttr(){
	var imgs = document.getElementsByTagName("img");
	for(var i in imgs){
		var img = imgs[i];
		if(!img.hasAttribute('src')){
			img.setAttribute('src','../img/boll.gif');
		}else{
			img.removeAttribute('src');
		}
	}
}
window.onload = operateAttr;