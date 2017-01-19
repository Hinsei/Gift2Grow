$(document).on('turbolinks:load',function(){
	$('#nextPart').hide()

	$('#agree-button').on('click', function(){
		if ($('#agree').is(':checked')) {
			$('#nextPart').show()
		} else {
			 alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false;
		}
	})

	console.log(gon.finished_giveaway)

	$.each(gon.finished_giveaway, function(index, value){
		console.log($('#timer' + value).html())
	})

});