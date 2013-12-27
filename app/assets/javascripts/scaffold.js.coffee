jQuery ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'
    min_selected_options: 2
    disable_search_threshold: 2
    no_results_text: "No character found!"