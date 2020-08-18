// @TODO: YOUR CODE HERE!
var svg_width = 900;
var svg_height = 450;
var margin = {
    top: 20,
    right: 40,
    bottom: 60,
    left: 50
}
var width = svg_width - margin.right - margin.left;
var height = svg_height - margin.top - margin.bottom;

var svg = d3
    .select ("#scatter")
    .append("svg")
    .attr("width", svg_width)
    .attr("height", svg_height);

var chart= svg.append("g")
    .attr("transform",`translate(${margin.left},${margin.top})`);

d3.csv("./assets/data/data.csv").then(function(journal_data) {
        //parse date 
    journal_data.forEach(function(line) {
        line.id = +line.id;
        line.state = +line.state;
        line.ageMoe = +line.ageMoe;
        line.healthcare = +line.healthcare;
        line.smokes = +line.smokes;
        line.poverty = +line.poverty;
        line.povertyMoe = +line.povertyMoe;
        line.age = +line.age;
    
        });
    var xscale = d3.scaleLinear()
        .domain([8, d3.max(journal_data, l => l.poverty)])
        .range([0, width])
    var yscale = d3.scaleLinear()
        .range([height,0])
        .domain([4, d3.max(journal_data, l => l.healthcare)])
    
    var bottom_axis = d3.axisBottom(xscale)
    var left_axis = d3.axisLeft(yscale)

    chart.append("g")
        .attr("transform", `translate(0, ${height})`)
        .call(bottom_axis);
    
    chart.append("g")
        .call(left_axis);


// Circles

    var Circles_group = chart.selectAll("circle")
        .data(journal_data)
        .enter()
        .append("circle")
        .attr("cx", d => xscale(l.poverty))
        .attr("cy", d => yscale(l.healthcare))
        .attr("r", "25")
        .attr("fill", "blue")
        .attr("opacity", "0.5")
        .text("10", "10", "sans-serif", "10px", "grey");

    var c_labels= chart.selectAll(null).line(journal_data).enter().append("text");

    c_labels
        .attr("x", function(l){
            return xscale(l.poverty);
        })
        .attr("y", function(l){
            return yscale(l.healthcare);
        })
        .text(function(l){
            return l.abbr;
        })
        .attr("font-family", "times-new-roman")
        .attr("font-size", "12px")
        .attr("text-anchor", "middle");


    chart.append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 0 - margin.left)
        .attr("x", 0 - (height / 2))
        .attr("dy", "1em")
        .attr("class", "axisText")
        .text("Healthcare (%)");

    chartgroup.append("text")
        .attr("transform", `translate(${width / 2}, ${height + margin.top + 20})`)
        .attr("class", "axisText")
        .text("Poverty(%)");


}).catch(function(error) {
    console.log(error)
});

