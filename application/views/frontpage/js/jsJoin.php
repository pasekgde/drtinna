<?php
	$plugin_url = base_url()."theme_costume/";
?>


<!--  <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
 --> <script>
       function onSubmit(token) {
       	$(':input[type="submit"]').attr('disabled', 'disabled');
       
		$.dialog({
		    icon: 'fa fa-spinner fa-2x fa-spin',
		    title: false,
		    title:'Relax!',
		    content: 'Sit back, we are processing your request!',
		    cancelButton: false, // hides the cancel button.
		    okButton: false, // hides the cancel button.
		    closeButton: false, // hides the cancel button.
    		confirmButton: false, // hides the confirm button.
    		closeIcon: false, // hides the close icon.
    	 // hides content block.
		});
         document.getElementById("checkoutform").submit();
       }
</script>


<script>

$(document).ready(function() {
	$('.daftar').submit(function() {
		alert ("ok!");
		
	});	

	var $container = $("html,body");
	var $scrollTo = $('.register-form');

	
	
	$('select#dos').on('change', function() {
		$(".priceamount").text( $('option:selected', this).data( "factor" ));

		var text = $('option:selected', this).text();
		var arr = text.split('-');
		$(".duration_value").text($.trim(arr[0]));
		
	});	

	$('#checkoutform').submit(function() {
		
	});
	
	$('select#payment_method').on('change', function() {
		if(this.value == "paypal"){
			//alert($("input#emailpaypal").val()  );
			if( $("input#emailpaypal").val() == $("input#emailpaypal").attr("placeholder")){
				alert("please fill out the paypal email account!");
			}
		}
		
	});
	


	
})


</script>
