jQuery ->
  $("body >").each (i, el) ->
  	$(el).css
  		opacity: 0
    $(el).delay(i*200).transition
    	opacity: 1
$(window).on 'load', ->
  window._loaded = true