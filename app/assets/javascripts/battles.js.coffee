# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	isActive = true

	window.onfocus = ->
		isActive = true

	window.onblur = ->
		isActive = false

	$('.attention-shake').each ->
		that = this
		mouseOver = false
		$('.attention-shake >').mouseenter ->
			mouseOver = true
		$('.attention-shake >').mouseout ->
			mouseOver = false
		setInterval ->
			if !mouseOver and isActive
				$(that).effect 'shake',
					direction: 'left'
					distance: 10
					times: 2
				,600
		,4000