function login(caller){
	var form = $(this).closest("form"); 
	var params = [ "email" , "password" ]; 
	var data = params.reduce(function(prev, curr, i , arr){ 
		var v = form.find( "[name="+ curr +"]" );  
		console.log(v); 
		if(v.length === 0) return prev;
		prev[ arr[i] ] = v.val(); return prev;  
	} , {} );
	console.log(data);  
}