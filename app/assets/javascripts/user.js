function login(caller){
	var form = $(this).closest("form"); 
	var params = [ "email" , "password" ]; 
	var data = params.reduce(function(prev, curr, i , arr){ 
		var v =form.find( "[name~="+ arr[i] +"]" );  
		if(v.length > 0) return curr;
		curr[ arr[i] ] = v.val(); return curr;  
	} , {} );
	console.log(data);  
}