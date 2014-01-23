$(->
	$('#house-button').on('click', ->
		$('form').css('display','block');
	)
	$('#apartment-button').on('click', ->
		$('form').css('display','block');
		$('#location_apartment_number').css('display','inline');
		$('#apartment-label').css('display','inline');
	)	
	$('#buisness-button').on('click', ->
		$('form').css('display','block');
	)
)
