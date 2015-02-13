function login(caller){
	var form = $(this).closest("form"); 
	var params = [ "email" , "password" ]; 
	var data = params.reduce(function(prev, curr, i , arr){ curr["email"] = form.find( "[name~="+ arr[i] +"]" );  } , {} );
	console.log(data);  
}