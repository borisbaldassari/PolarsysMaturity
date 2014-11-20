package Castalia::PublishHTML;

use strict;
use warnings;

use Data::Dumper;

use Exporter qw(import); 
our @EXPORT_OK = qw( 
  get_html_start
  get_html_end
  get_html_qm
);


# Piece of HTML that be printed at the beginning of every HTML  document.
my $html_start = <<'EOHS';
<!doctype html>
  <!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
  <!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
  <!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
  <!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="/css/plugins/timeline.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <!-- link href="/css/plugins/morris.css" rel="stylesheet" -->

    <!-- Custom Fonts -->
    <link href="/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Our CSS sheets -->
    <link rel="stylesheet" href="/css/main.css">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
    <div id="#wrapper">

EOHS
#'


# Piece of HTML that be printed at the end of every HTML document.
my $html_end = <<'EOHE';
    </div>

    <!--[if lt IE 7]>
    <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- Google Analytics: change UA-XXXXX-X to be your site ID. -->
    <script>
      (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
      function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
      e=o.createElement(i);r=o.getElementsByTagName(i)[0];
      e.src='//www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
      ga('create','UA-XXXXX-X');ga('send','pageview');
    </script>

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <!-- script src="/js/plugins/morris/raphael.min.js"></script>
    <script src="/js/plugins/morris/morris.min.js"></script>
    <script src="/js/plugins/morris/morris-data.js"></script -->

    <!-- Custom Theme JavaScript -->
    <script src="/js/sb-admin-2.js"></script>

    
    <!-- JavaScripts -->
    <!-- script src="/bower_components/modernizr/modernizr.js"></script-->
    
    <!-- script src="/bower_components/bootstrap/js/affix.js"></script>
    <script src="/bower_components/bootstrap/js/alert.js"></script>
    <script src="/bower_components/bootstrap/js/dropdown.js"></script>
    <script src="/bower_components/bootstrap/js/tooltip.js"></script>
    <script src="/bower_components/bootstrap/js/modal.js"></script>
    <script src="/bower_components/bootstrap/js/transition.js"></script>
    <script src="/bower_components/bootstrap/js/button.js"></script>
    <script src="/bower_components/bootstrap/js/popover.js"></script>
    <script src="/bower_components/bootstrap/js/carousel.js"></script>
    <script src="/bower_components/bootstrap/js/scrollspy.js"></script>
    <script src="/bower_components/bootstrap/js/collapse.js"></script>
    <script src="/bower_components/bootstrap/js/tab.js"></script -->
        
</body>
</html>
EOHE
#'

my $html_qm = <<EOHQ;
              <h3>The Quality model</h3>
            
            <p>The quality model shows the complete hierarchy tree, from <a href="/documentation/attributes.html">quality attributes</a> to <a href="/documentation/questions.html">measurement concepts</a> (questions) and <a href="/documentation/metrics.html">metrics</a>. Following Basili's Goal-Question-Metric approach [<a href="/documentation/references.html#Basili1994">Basili1994</a>], the quality attributes (the 3 first columns) are goals for our measurement, concepts (4th col) are mapped to questions, and metrics (right col) are the base measures.</p>
            
<div id="tree"></div>

<script src="/js/d3/d3.min.js"></script>
<script>

var margin = {top: 20, right: 120, bottom: 20, left: 10},
    width = 1100 - margin.right - margin.left,
    height = 1024 - margin.top - margin.bottom;
    
var i = 0,
    duration = 750,
    root;

var tree = d3.layout.tree()
    .size([height, width]);

var diagonal = d3.svg.diagonal()
    .projection(function(d) { return [d.y, d.x]; });

var svg = d3.select("div#tree").append("svg")
    .attr("width", width + margin.right + margin.left)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

//var mycolours = ["#fff", "#ff0000", "#cc3300", "#996600", "#669900", "#33CC00"];
var mycolours = ["#ebebeb", "#FFFF66", "#CCF24D", "#99E633", "#66D91A", "#33CC00"];

var myattrs = {};
var mymetrics = {};
var myconcepts = {};
var myvalues = new Object();

// Load file for attributes.
d3.json("../data/polarsys_attributes.json", function(error, attributes) {
  if (error) return console.warn(error);

  for(i=0;i<attributes.children.length;i++) {
    attr_mnemo = attributes.children[i]['mnemo'];
    myattrs[attr_mnemo] = attributes.children[i];
  }
});

// Load file for concepts.
d3.json("../data/polarsys_questions.json", function(error, concepts) {
  if (error) return console.warn(error);
  
  for(i=0;i<concepts.children.length;i++) {
    concept_name = concepts.children[i].mnemo;
    myconcepts[concept_name] = concepts.children[i];
  }
});

// Load file for metrics.
d3.json("../data/polarsys_metrics.json", function(error, metrics) {
  if (error) return console.warn(error);
  
  for(i=0;i<metrics.children.length;i++) {
    metric_name = metrics.children[i].mnemo;
    mymetrics[metric_name] = metrics.children[i];
  }
});

d3.json("<PROJ_ID>_qm.json", function(error, qm) {
  if (error) return console.warn(error);

//  alert("Length of myvalues: " + myvalues.length);
//  alert("myvalues: " + Object.keys(myvalues));

  root = qm;
  root.x0 = height / 2;
  root.y0 = 0;

  function collapse(d) {
    if (d.children) {
      d._children = d.children;
      d._children.forEach(collapse);
      d.children = null;
    }
  }

  function firstCollapse(d) {
    if (d.children) {
      d._children = d.children;
      for(i=0;i<d._children.length;i++) {
        d._children[i].children.forEach(collapse);
      }
    }
  }

  //root.children.forEach(firstCollapse);
  update(root);
});

function update(source) {

  var tabs = [0, 100, 200, 400, 630, 700];

  // Compute the new tree layout.
  var nodes = tree.nodes(root).reverse(),
      links = tree.links(nodes);

  // Normalize for fixed-depth.
  nodes.forEach(function(d, i) { 
    d.y = tabs[d.depth];
  });

  // Update the nodes…
  var node = svg.selectAll("g.node")
      .data(nodes, function(d) { return d.id || (d.id = ++i); });

  // Enter any new nodes at the parent's previous position.
  var nodeEnter = node.enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
      .on("click", click);

  nodeEnter.append("circle")
      .attr("r", 1e-6)
      .style("fill", function(d) { 
        return d.value ? mycolours[parseInt(d.value)] : "gray"; 
      })
      .style("stroke", function(d) {
	  return "black";
	  //return d.value ? mycolours[parseInt(d.value)] : "gray"; 
      });

  nodeEnter.append("text")
      .attr("x", function(d) { return d.children || d._children ? -20 : 20; })
      .attr("dy", function(d) { return d.children || d._children ? "-0.5em" : ".35em" })
      .attr("text-anchor", function(d) { return d.children || d.children ? "end" : "start"; })
      .attr("fill", function(d) { return d.active == "true" ? "black" : "gray";})
      .text(function(d) { 
        return d.value ? d.name + " (" + d.value + ")" : d.name;
      })
      .style("fill-opacity", 1e-6);

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
      .attr("r", 7)
      .style("fill", function(d) { 
        return d.value ? mycolours[parseInt(d.value)] : "gray"; 
      })
      .style("stroke", function(d) {
	  return "black";
	  //return d.value ? mycolours[parseInt(d.value)] : "gray"; 
      });

  nodeUpdate.select("text")
      .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position.
  var nodeExit = node.exit().transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
      .remove();

  nodeExit.select("circle")
      .attr("r", 1e-6);

  nodeExit.select("text")
      .style("fill-opacity", 1e-6);

  // Update the links…
  var link = svg.selectAll("path.link")
      .data(links, function(d) { return d.target.id; });

  // Enter any new links at the parent's previous position.
  link.enter().insert("path", "g")
      .attr("class", "link")
      .attr("d", function(d) {
        var o = {x: source.x0, y: source.y0};
        return diagonal({source: o, target: o});
      });

  // Transition links to their new position.
  link.transition()
      .duration(duration)
      .attr("d", diagonal);

  // Transition exiting nodes to the parent's new position.
  link.exit().transition()
      .duration(duration)
      .attr("d", function(d) {
        var o = {x: source.x, y: source.y};
        return diagonal({source: o, target: o});
      })
      .remove();

  // Stash the old positions for transition.
  nodes.forEach(function(d) {
    d.x0 = d.x;
    d.y0 = d.y;
  });
}

// Toggle children on click.
function click(d) {

  var i = 0;
  var mynode;

  // find element in our json files (metrics, concepts, attributes of quality).
  if (typeof d.type == "undefined") {
    alert("No type defined on node.");
  } else {
    if (d.type == "metric") {
      mynode = d;
      mynode.description = mymetrics[d.mnemo]["desc"]; 
      mynode.name = mymetrics[d.mnemo]["name"]; 
      mynode.datasource = mymetrics[d.mnemo]["ds"]; 

      var mydiv = d3.select("div#details-box");

      mydiv.text("");

      var ptitle = mydiv.append('p');
      ptitle.classed("title", true);
      ptitle.text(d.type.charAt(0).toUpperCase() + d.type.slice(1) + ": " + mynode.name + " (" + mynode.mnemo + ")"); 
  
      p = mydiv.append('p');
      ptitle = p.append('span');
      ptitle.classed("details-title", true); 
      ptitle.text("Active:")
      pactive = p.append('span');
      pactive.classed("details", true);
      pactive.text(mynode.active.charAt(0).toUpperCase() + mynode.active.slice(1));

      p = mydiv.append('p');
      ptitle = p.append('span');
      ptitle.classed("details-title", true); 
      ptitle.text("Data source:")
      psource = ptitle.append('span');
      psource.classed("details", true);
      psource.text(mynode.datasource);

      pdesct = mydiv.append('p');
      pdesct.classed("details-title", true); 
      pdesct.text("Description:")
      for (desc_idx = 0 ; desc_idx < mynode.description.length ; desc_idx++) {
          var pdesc = mydiv.append('p');
          pdesc.classed("details", true);
          pdesc.html(mynode.description[desc_idx]);
      }
    } else if (d.type == "concept") {
      mynode = d;
      mynode.description = myconcepts[d.mnemo]["desc"]; 
      mynode.name = myconcepts[d.mnemo]["name"]; 
      mynode.question = myconcepts[d.mnemo]["question"]; 

      var mydiv = d3.select("div#details-box");

      mydiv.text("");

      var ptitle = mydiv.append('p');
      ptitle.classed("title", true);
      ptitle.text(d.type.charAt(0).toUpperCase() + d.type.slice(1) + ": " + mynode.name + " (" + mynode.mnemo + ")"); 
  
      p = mydiv.append('p');
      ptitle = p.append('span');
      ptitle.classed("details-title", true); 
      ptitle.text("Active:")
      pactive = p.append('span');
      pactive.classed("details", true);
      pactive.text(mynode.active);

      pdesct = mydiv.append('p');
      pdesct.classed("details-title", true); 
      pdesct.text("Question:")
      var pdesc = mydiv.append('p');
      pdesc.classed("details", true);
      pdesc.text(mynode.question);
      
      pdesct = mydiv.append('p');
      pdesct.classed("details-title", true); 
      pdesct.text("Description:")
      for (desc_idx = 0 ; desc_idx < mynode.description.length ; desc_idx++) {
          var pdesc = mydiv.append('p');
          pdesc.classed("details", true);
          pdesc.html(mynode.description[desc_idx]);
      }
    } else if (d.type == "attribute") {
      mynode = d;
      mynode.description = myattrs[d.mnemo]["desc"]; 
      mynode.name = myattrs[d.mnemo]["name"]; 

      var mydiv = d3.select("div#details-box");

      mydiv.text("");

      var ptitle = mydiv.append('p');
      ptitle.classed("title", true);
      ptitle.text(d.type.charAt(0).toUpperCase() + d.type.slice(1) + ": " + mynode.name + " (" + mynode.mnemo + ")"); 
    
      var pactive = mydiv.append('p');
      ptitle = pactive.append('span');
      ptitle.classed("details-title", true); 
      ptitle.text("Active:")
      pactive = pactive.append('span');
      pactive.classed("details", true);
      pactive.text(mynode.active);

      pdesct = mydiv.append('p');
      pdesct.classed("details-title", true); 
      pdesct.text("Description:")
      for (desc_idx = 0 ; desc_idx < mynode.description.length ; desc_idx++) {
          var pdesc = mydiv.append('p');
          pdesc.classed("details", true);
          pdesc.text(mynode.description[desc_idx]);
      }
    
    }
  }

  if (d.shiftKey) {
    alert("Shift key pressed!");
  }
}

</script>

<div id="details-box"><p>Click on a node to get more details.</p></div>

EOHQ
#'

sub get_html_start() {
    return $html_start;							      
}

sub get_html_end() {
    return $html_end;
}

sub get_html_qm($) {
    my $project_id = shift;

    my $html_qm_ret = $html_qm;
    $html_qm_ret =~ s/<PROJ_ID>/${project_id}/g;
    return $html_qm_ret;
}

1;
