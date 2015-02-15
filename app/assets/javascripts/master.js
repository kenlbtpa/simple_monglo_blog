$(document).bind("ajaxSend", function(elm, xhr, s){
   if (s.type == "POST") {
      xhr.setRequestHeader('X-CSRF-Token', getCSRF());
   }
});

function getCSRF(){ return $("meta[name=csrf-token]").attr("content"); }


function buildFormData(caller, params){
	var form = $(caller).is("form") ? $(caller) : $(this).closest("form");
	var data = params.reduce(function(prev, curr, i , arr){ 
		var v = form.find( "[name="+ curr +"]" );  
		if(v.length === 0) return prev;
		prev[ arr[i] ] = v.val(); return prev;  
	} , {} );
	data["CSRF"] = getCSRF();  	
	return data; 
}