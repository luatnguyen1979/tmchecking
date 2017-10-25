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
        });
        
        function getProduct(event, id) {
			console.info(id);
			event.preventDefault();
			$.ajax({
				type : 'GET',
				url : contextRoot + '/product/'+id,
				contentType : 'application/json', 
				success: function( product ) {
					console.info("success");
		            $("#product_view #name").text(product.name);
		            $("#product_view #details").text(product.details);
		            $("#product_view #price").text(product.price);
		            $("#product_view #image").attr("src","resource/images/products/" + product.id + ".jpg");
		            $('#quantity').attr("max", product.quantity);
		            if (product.quantity>0) {
		            	$('#quantity').val(1);
		            	$('#addToCart').removeAttr("disabled");
		            } else {
		            	$('#quantity').val(0);
		            	$('#addToCart').attr("disabled", "disabled");
		            }
		            $("#product_view").data("product", product);
		            $("#product_view").modal("toggle");
				},
				error: function( errorObject ){	
					console.info("error");
				}
			
			});	
        }

        function addToCart() {
            var product = $("#product_view").data("product");
			var qty = $('#quantity').val();
				
			$.ajax({
				type : 'POST',
				url : contextRoot + '/addToCart/'+product.id + '/' + qty,
				contentType : 'application/json', 
				success: function( number ) {
					console.info("success");
					$("#cartItemNum").text(number);
					$("#product_view").modal('hide');
				},
				error: function( errorObject ){	
					console.info("error");
				}
			});				
       	}
