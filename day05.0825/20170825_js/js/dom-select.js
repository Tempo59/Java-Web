function selectByIdentity(all){
	//
	//var all = document.getElementById("all");
	var ids = document.getElementsByName("ids");
	for(var i in ids){
		ids[i].checked = all.checked;
	}
}

function selectAll(){
	var ids = document.getElementsByName("ids");
	for(var i in ids){
		ids[i].checked = true;
	}
}

function inverseSelect(){
	var ids = document.getElementsByName("ids");
	for(var i in ids){
		ids[i].checked = !ids[i].checked;
	}
}
