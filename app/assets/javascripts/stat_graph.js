jQuery(function(){

	$('#stat_body').each(function(){
		var w = 300,
		h = 300;

		var character = gon.global.character;

		var legendTitle = "";

		var colorscale = d3.scale.category10();

		//Legend titles
		var LegendOptions = ['*Average',character.name];

		//Data
		var ave_stats = gon.global.char_stat_ave;
		var d = [
				  [
					{axis:"Health",value: ave_stats["stat_hp"] || 0},
					{axis:"Strength",value:ave_stats["stat_str"] || 0},
					{axis:"Defense",value:ave_stats["stat_def"] || 0},
					{axis:"Speed",value:ave_stats["stat_spd"] || 0},
					{axis:"Intelligence",value:ave_stats["stat_int"] || 0},
					{axis:"Luck",value:ave_stats["stat_luck"] || 0}
				  ],[
					{axis:"Health",value: character.stat_hp },
					{axis:"Strength",value: character.stat_str },
					{axis:"Defense",value: character.stat_def },
					{axis:"Speed",value: character.stat_spd },
					{axis:"Intelligence",value: character.stat_int },
					{axis:"Luck",value: character.stat_luck }
				  ]
				];

		//Options for the Radar chart, other than default
		var mycfg = {
		  w: w,
		  h: h,
		  radius: 4,
		  maxValue: 100,
		  levels: 5,
		  levelLabels: true,
		  d3Format: 'd',
		  showOuterLevel: true,
		  ExtraWidthX: 300
		}

		//Call function to draw the Radar chart
		//Will expect that data is in %'s
		RadarChart.draw("#stat_chart", d, mycfg);

		////////////////////////////////////////////
		/////////// Initiate legend ////////////////
		////////////////////////////////////////////

		var svg = d3.select('#stat_body')
			.selectAll('svg')
			.append('svg')
			.attr("width", w+300)
			.attr("height", h)

		//Create the title for the legend
		var text = svg.append("text")
			.attr("class", "title")
			.attr('transform', 'translate(90,0)') 
			.attr("x", w - 70)
			.attr("y", 10)
			.attr("font-size", "12px")
			.attr("fill", "#404040")
			.text(legendTitle);
				
		//Initiate Legend	
		var legend = svg.append("g")
			.attr("class", "legend")
			.attr("height", 100)
			.attr("width", 200)
			.attr('transform', 'translate(90,20)') 
			;
			//Create colour squares
			legend.selectAll('rect')
			  .data(LegendOptions)
			  .enter()
			  .append("rect")
			  .attr("x", w - 65)
			  .attr("y", function(d, i){ return i * 20;})
			  .attr("width", 10)
			  .attr("height", 10)
			  .style("fill", function(d, i){ return colorscale(i);})
			  ;
			//Create text next to squares
			legend.selectAll('text')
			  .data(LegendOptions)
			  .enter()
			  .append("text")
			  .attr("x", w - 52)
			  .attr("y", function(d, i){ return i * 20 + 9;})
			  .attr("font-size", "11px")
			  .attr("fill", "#737373")
			  .text(function(d) { return d; })
			  ;	
	});
});
