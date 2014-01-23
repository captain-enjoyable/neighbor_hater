$(->
	$('#house-button').on('click', ->
		$('form').show()
		$("#address-type").val("house")
		$('#apartment-number-input').hide()
		$('#apartment-number-label').hide()
	)
	$('#apartment-button').on('click', ->
		$('form').show()
		$("#address-type").val("apartment")
		$('#apartment-number-input').show()
		$('#apartment-number-label').show()
	)
	$('#business-button').on('click', ->
		$('form').show()
		$("#address-type").val("business")
		$('#apartment-number-input').hide()
		$('#apartment-number-label').hide()
	)
)
