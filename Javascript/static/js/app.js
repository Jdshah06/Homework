// from data.js
var tableData = data;

var tbody=d3.select("tbody")
tableData.forEach(function(UFO){
    var row= tbody.append("tr")
    Object.defineProperties(UFO).forEach(function([key,value]){
        var cell= row.append("td")
        cell.text(value)
    })

});

function click(){
    d3.event.preventdefault();
    var date= d3.select("#datetime").property("value");
    var filter_Data= tabledata;

    if (date){
        filter_Data=filter_Data.filter((row) => row.datetime === date);
    }
    tableData(filter_Data)
}

d3.selectAll("filter-btn").on("click",click);

tableData(tableData)

