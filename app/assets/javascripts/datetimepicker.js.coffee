jQuery ->
	date = new Date()
	date.setHours(date.getHours() + 1)
	date.setMinutes(Math.ceil(date.getMinutes()/10)*10)
	$("input.datetimepicker").each (i) ->
		$(this).datetimepicker
			stepMinute: 10
			minDate: new Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes())
			maxDate: new Date(date.getFullYear(), date.getMonth()+1, date.getDate(), date.getHours(), date.getMinutes())