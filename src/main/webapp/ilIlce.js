var ilceler=new Array();
ilceler['Istanbul']=new Array('Bayrampasa','Beyoglu','Bakirkoy');
ilceler['Ankara']=new Array('Kizilay','Cankaya');
ilceler['Antalya']=new Array('Konyaalti','Gazipasa','Kemer');

function setIlceler(){
	ilSec=document.getElementById('il');
	ilceList=ilceler[ilSec.value];
	changeSelect('il',ilceList,ilceList);	
}

function changeSelect(fieldID,newOptions,newValues){
	selectField=document.getElementById(fieldID);
	selectField.options.length=0;
	for(i=0;i<newOptions.length;i++){
		selectField.options[selectField.length]=new Option(newOptions[i],newValues[i]);
	}	
}
function addLoadEvent(func){
	var oldonLoad=window.onload;
	if(typeof window.onload!='function'){
		window.onload=func;
	}
	else{
		window.onload=function(){
			if (oldonload){
				oldonload();
			}
			func();
		}
	}
	
}
addLoadEvent(function(){
	setIlceler();
	
});

