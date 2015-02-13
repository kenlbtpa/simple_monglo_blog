function buildFormData(caller, params){
	var form = $(caller).is("form") ? $(caller) : $(this).closest("form");
	var data = params.reduce(function(prev, curr, i , arr){ 
		var v = form.find( "[name="+ curr +"]" );  
		console.log( "v" , v); 
		if(v.length === 0) return prev;
		prev[ arr[i] ] = v.val(); return prev;  
	} , {} );
	return data; 
}

function login(caller){ /*Expects either this or document.getElementbyId form */
	var params = [ "email" , "password" ]; 
	var data = buildFormData(caller, params); 
	console.log(data); 
}

function register(caller){
	var params = [ "nickname" , "email" , "password" , "password_confirmation" ]; 
	var data = buildFormData(caller, params); 	
	console.log(data); 
}