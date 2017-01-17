$('document').on('turbolinks:load', function(){
	$('#nextPart').hide()

	$('#agree-button').on('click', function(){
		if ($('#agree').is(':checked')) {
			$('#nextPart').show()
		} else {
			 alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false;
		}
	})
});