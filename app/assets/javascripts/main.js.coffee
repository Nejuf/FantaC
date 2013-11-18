jQuery ->
  $(".navbar-static-top").each (i) ->
    $(this).hide("clip", 1)
    $(this).show("clip", 600)