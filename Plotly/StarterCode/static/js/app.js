function read(idname) {
    d3.json("samples.json").then((data) => {
        var id = data.metadata;
        var filter = id.filter( x => x.id == idname);
        filter=filter[0];
        var metadata= d3.select("#sample-metadata");
        metadata.html("");
        Object.defineProperties(filter).forEach(([key, value]) => {
            metadata.append("p").text(`${key}:${value}`);
        });
    });
}


function dropdown() {
    var id_drop = d3.select("#selDataset");
    d3.json("samples.json").then((data) => {
        var id_names = data.names;
        id_names.forEach((id) => {
            id_drop.append("option").text(id).property("value", id);
        })
    });
}

function optionChanged(new_id) {
    read_data(new_id);
    barPlot(new_id);
    bubbleplot(new_id);
}

function barplot(idname) {
    d3.json("samples.json").then((data) =>{
        var id_data= data.samples;
        var filter= id.filter(x => x.id == idname);
        filter=filter[0];
        var o_ids= filter.o_ids;
        var o_labels= filter.o_labels;
        var samplevalue= filter.sample_values;
        var y_axis= o_ids.slice(0,10).map(o_ids)

        var trace= [{
                y: y_axis,
                text: o_labels.slice(0,10),
                x: samplevalue.slice(0,10).reverse(),
                type: "bar",
                orientation:"h"}
        ];

        var layout = {
            title: "Top 10 IDs W/ Labels & Names"
        }

        Plotly.newplot("bar", trace, layout)
    });
    }

function bubbleplot(idname) {
    d3.json("samples.json").then((data) =>{
        var id_data= data.samples;
        var filter= id.filter(x => x.id == idname);
        filter=filter[0];
        var o_ids= filter.o_ids;
        var o_labels= filter.o_labels;
        var samplevalue= filter.sample_values;

        var trace_bubble = {
            x: o_ids,
            y: samplevalue,
            text: o_labels,
            mode: 'markers',
            marker:{
                color: o_ids,
                opacity: [ 1, 0,7, 0,6, 0,5],
                size: samplevalue
            }
        };

        var data= [trace_bubble];
        var layout= {
            title: "Bubble Chart",
            height: 1000,
            width: 2000
        };

        Plotly.newPlot("bubble",data, layout);
    });

}