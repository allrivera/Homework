// @TODO: YOUR CODE HERE!
​
// You need to create a scatter plot between two of the data 
// variables such as Healthcare vs. Poverty 
// or Smokers vs. Age.
// Using the D3 techniques we taught you in class, 
// create a scatter plot that represents each state 
//with circle elements. 
//You'll code this graphic in the app.js file of your homework directory—make sure you pull in the data from data.csv by using the d3.csv function. Your scatter plot should ultimately appear like the image at the top of this section.
​
​
// Include state abbreviations in the circles.
​

// set the dimensions and margins of the graph 
var svgWidth = 960;
var svgHeight = 500;
​
var margin = {
	top: 60,
	right: 60,
	bottom: 60,
	left: 60
};
​
var chartWidth = svgWidth - margin.left - margin.right;
var chartHeight = svgHeight - margin.top - margin.bottom;
​
var svg = d3.select("#scatter")
	.append("svg")
	.attr("width", svgWidth)
	.attr("height", svgHeight);
​
// Create + Append group area, then set margins
​
var chartGroup = svg
	.append("g")
	.attr("transform", "translate(" +margin.left + ", " +margin.top+")");
​
// read the data
var file = "assets/data/data.csv"
​
d3.csv(file).then(vizData);
​
// vizdata function will take in the state data
function vizData(state) {
	state.map(function(data) {
		data.poverty = +data.poverty;
		data.obesity = +data.obesity;
	});
​
// Setting up axes to along with the min and max values of the data
	var xScale = d3.scaleLinear()
    	.domain([8.5, d3.max(stateData, d => d.poverty)])
    	.range([0, width]);
​
  	var yScale = d3.scaleLinear()
    	.domain([20, d3.max(stateData, d => d.obesity)])
    	.range([height, 0]);
​
  	var bottomAxis = d3.axisBottom(xScale);
 	var leftAxis = d3.axisLeft(yScale);
​
 // Append axes to chart group
​
 	chartGroup.append("g")
 	.attr("transform", `translate(0, ${height})`)
 	.call(bottomAxis);
 	chartGroup.append("g")
 	.call(leftAxis);
​
 	// create dots for plot
 	var circlesGroup = chartGroup.selectAll("circle")
 	.data(state)
 	.enter()
 	.append("circle")
 	.attr("cx", d => xScale(d.poverty))
 	.attr("cy", d => yScale(d.obesity))
 	.attr("r", "15")
 	.attr("fill", "#333333");
​
 	// add text to circles
 	var circlesGroup = chartGroup.selectAll()
 	.data(state)
 	.enter()
 	.append("text")
 	.attr("x", d => xScale(d.poverty))
 	.attr("y", d => yScale(d.obesity))
 	.style("font-size", "12px")
 	.style("");
​
​
}
​
​
​
