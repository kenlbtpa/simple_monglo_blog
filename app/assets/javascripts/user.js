/*Move This to Master Js File Later*/
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

function login(caller){ /*Expects either this or document.getElementbyId form */

	console.log('stable'); 
	return false; 

	var params = [ "email" , "password" ]; 
	var data = buildFormData(caller, params); 
	var form = $(caller).is("form") ? $(caller) : $(this).closest("form");
	$.ajax({
		url: form.attr("action"), 
		type: form.attr("method"), 
		data: data,
		error: function(jqxhr, response, status){ 
			console.log(jqxhr, response, status); 
			form.find( ".ajaxErrors" ).html( "<span style='color:red' > Your request could not be processed. </span>" ); 
		}, 
		success: function(response){
			form.find( ".ajaxErrors" ).html( "<span style='color:green' > Your are now logged in. </span>" ); 
			// setTimeout( function(){ window.location.reload(); } , 2000 ); 
		}
	}); 
}

function register(caller){
	var params = [ "nickname" , "email" , "password" , "password_confirmation" ]; 
	var data = buildFormData(caller, params);
	var form = $(caller).is("form") ? $(caller) : $(this).closest("form");
	$.ajax({
		url: form.attr("action"), 
		type: form.attr("method"), 
		data: data,
		error: function(jqxhr, response, status){ 
			console.log(jqxhr, response, status); 
			form.find( ".ajaxErrors" ).html( "<span style='color:red' > Your request could not be processed. </span>" ); 
		}, 
		success: function(response){
			form.find( ".ajaxErrors" ).html( "<span style='color:green' > Your account has been created. </span>" ); 
			setTimeout( function(){ window.location.reload(); } , 2000 ); 
		}
	}); 
}