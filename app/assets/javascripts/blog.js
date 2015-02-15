function blog_create(caller){ /*Expects either this or document.getElementbyId form */
	var params = [ "title" , "content" ]; 
	var data = buildFormData(caller, params);
	var form = $(caller).is("form") ? $(caller) : $(this).closest("form");

	var formData = new FormData(this); 
	for(var i in data){ formData.append( i , data[i] ); }
	formData.append( 'image' , $('#createFormImage')[0].files[0] ); 

	$.ajax({
		url: form.attr("action"), 
		type: form.attr("method"), 
		data: formData,
		processData: false, 
		contentType: false , 
		error: function(jqxhr, response, status){ 
			console.log(jqxhr, response, status); 
			form.find( ".ajaxErrors" ).html( "<span style='color:red' > Your request could not be processed. </span>" ); 
		}, 
		success: function(response){
			var data = response[0];  
			if( data['status'] ){
				form.find( ".ajaxErrors" ).html( "<span style='color:green' > Your form has been success created. </span>" ); 
				setTimeout( function(){ window.location.reload(); } , 2000 ); 
			}else{
				form.find( ".ajaxErrors" ).html( "<span style='color:red' > "+ data['error'] +" </span>" ); 
			}
		}
	}); 
}
