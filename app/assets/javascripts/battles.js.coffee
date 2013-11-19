# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	jQuery ->
		setInterval ->
			$('.attention-shake').effect 'shake',
				direction: 'left'
				distance: 10
				times: 2
			,600
		,4000