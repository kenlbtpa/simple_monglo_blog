function login(caller){ /*Expects either this or document.getElementbyId form */

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
			var data = response[0];  
			if( data['status'] ){
				form.find( ".ajaxErrors" ).html( "<span style='color:green' > Your are now logged in. </span>" ); 
				setTimeout( function(){ window.location.reload(); } , 2000 ); 
			}else{
				form.find( ".ajaxErrors" ).html( "<span style='color:red' > "+ data['error'] +" </span>" ); 
			}
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
			var data = response[0];  
			if( data['status'] ){
				form.find( ".ajaxErrors" ).html( "<span style='color:green' > Your account has been created. </span>" ); 
				setTimeout( function(){ window.location.reload(); } , 2000 ); 
			}else{
				form.find( ".ajaxErrors" ).html( "<span style='color:red' > "+ data['error'] +" </span>" ); 
			}
		}
	}); 
}