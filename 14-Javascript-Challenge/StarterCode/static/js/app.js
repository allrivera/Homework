// from data.js
var tableData = data;

// INSTRUCTIONS: Using the UFO dataset provided in the form of an array of JavaScript objects, write code that appends a table to your web page and then adds new rows of data for each UFO sighting.

// YOUR CODE HERE!

var tbody = d3.select("tbody");

// console.log the weather data
console.log(data);

data.forEach((ufoSightings) => {
	var row = tbody.append("tr");
	Object.entries(ufoSightings).forEach(([key, value]) => {
		var cell = row.append("td");
		cell.text(value);
	})
})

