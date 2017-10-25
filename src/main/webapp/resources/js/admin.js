		var contextRoot = "/" + window.location.pathname.split( '/' )[1];
        $(document).ready(function(){
            var quantitiy=0;
            $('.quantity-right-plus').click(function(e){

                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('#quantity').val());
				var max= parseInt($('#quantity').attr("max"));
                
				if (quantity < max) {
	                $('#quantity').val(quantity + 1);
	                // Increment
				} 
            });

            $('.quantity-left-minus').click(function(e){
                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('#quantity').val());
                // If is not undefined
                // Increment
                if(quantity>1){
                    $('#quantity').val(quantity - 1);
                }
            });

            $('#addNewProduct').click(function(e){
                // Stop acting like a button
                e.preventDefault();
	            $("#product_view #name").val("");
	            $("#product_view #details").val("");
	            $("#product_view #tag").val("");
	            $("#product_view #price").val("");
	            $("#product_view #quantity").val("");
	            $("#product_view #id").val("");
	            $("#product_view #image").attr("src","");
	            $("#product_view").data("product");
	            $("#product_view").modal("toggle");
            });

        });
        
        function showEdit(event, id) {
			console.info(id);
			event.preventDefault();
			$.ajax({
				type : 'GET',
				url : contextRoot + '/product/'+id,
				contentType : 'application/json', 
				success: function( product ) {
					console.info("success");
		            $("#product_view #name").val(product.name);
		            $("#product_view #details").val(product.details);
		            $("#product_view #tag").val(product.tag);
		            $("#product_view #price").val(product.price);
		            $("#product_view #quantity").val(product.quantity);
		            $("#product_view #id").val(product.id);
		            $("#product_view #image").attr("src","resource/images/products/" + product.id + ".jpg");
		            $("#product_view #errors").empty();
		            $("#product_view").data("product", product);
		            $("#product_view").modal("toggle");
				},
				error: function( errorObject ){	
					console.info("error");
				}
			
			});	
        }
        
        function showDelete(event, id) {
			console.info(id);
			event.preventDefault();
            $("#confirmDelete #id").val(id);
            $("#confirmDelete").modal("toggle");
        }        

        function loadFile(e) {
			$("#product_view #image").attr("src",URL.createObjectURL(event.target.files[0]));
        }
        
        function submitProductSaveForm(e) {
        	console.info("on click");
        	event.preventDefault();
            $("#product_view #errors").empty();
        	var dataToSend = JSON.stringify(serializeObject($('#saveProduct')));
			$.ajax({
				type : 'POST',
				url : contextRoot + '/validate',
				contentType : 'application/json', 
				dataType : "json", 
				data : dataToSend,
				success: function( product ) {
					console.info("success");
		        	document.getElementById("saveProduct").submit();
				},
				error: function( errorObject ){	
					if (errorObject.responseJSON.errorType == "ValidationError") {
						//More Code here..
						var errorList = errorObject.responseJSON.errors;
						$("#errors").append('<p>');
						$.each(errorList, function(i, error) {
							$("#errors").append(error.message + '<br>');
						});
						$("#errors").append('</p>');
						$('#errors').show();
					} else {
						$("#errors").append('<p>');
						$("#errors").append(errorObject.responseJSON.errorType + '<br>');
						$("#errors").append('</p>');
						$('#errors').show();
					}		
				}
			});	
        }
        
        function submitProductDeleteForm(e) {
        	console.info("on delete click");
        	event.preventDefault();
		    document.getElementById("deleteProduct").submit();
        }
        
        function serializeObject (form)
        {
            var jsonObject = {};
            var array = form.serializeArray();
            $.each(array, function() {
                 	jsonObject[this.name] = this.value;
            });
            return jsonObject;

        };   