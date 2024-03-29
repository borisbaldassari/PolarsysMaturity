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

my $local_time = localtime();


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

    <!-- Custom CSS -->
    <link href="/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">

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
    <div id="wrapper">

EOHS
#'


# Piece of HTML that be printed at the end of every HTML document.
my $html_end = "         <hr />
         <p>This page was generated on ${local_time}.</p>";

$html_end .= <<'EOHE';

          </div>
        </div>
      </div>
    </div>

    <!--[if lt IE 7]>
    <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

			     ga('create', 'UA-3675452-13', 'auto');
			     ga('send', 'pageview');

			     </script>

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/js/sb-admin-2.js"></script>
        
</body>
</html>
EOHE
#'

my $html_qm = <<EOHQ;

              <h3>The Quality model</h3>
            
            <p>The quality model shows the complete hierarchy tree, from <a href="/documentation/attributes.html">quality attributes</a> to <a href="/documentation/questions.html">measurement concepts</a> (questions) and <a href="/documentation/metrics.html">metrics</a>. Following Basili's Goal-Question-Metric approach [<a href="/documentation/references.html#Basili1994">Basili1994</a>], the quality attributes (the 3 first columns) are goals for our measurement, concepts (4th col) are mapped to questions, and metrics (right col) are the base measures.</p>
              <div class="row">
            <div class="col-lg-7">
        
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
        return d.ind ? mycolours[Math.floor(d.ind)] : "gray"; 
      })
      .style("stroke", function(d) {
	  return "black";
	  //return d.ind ? mycolours[d.ind] : "gray"; 
      });

  nodeEnter.append("text")
      .attr("x", function(d) { return d.children || d._children ? -15 : 20; })
      .attr("dy", function(d) { return d.children || d._children ? "-0.5em" : ".35em" })
      .attr("text-anchor", function(d) { return d.children || d.children ? "end" : "start"; })
      .attr("fill", function(d) { return d.active == "true" ? "black" : "gray";})
      .text(function(d) { 
        value = d.value ? d.value + " / " : "";
	ind = d.ind ? " (" + value + d.ind + ")" : "";
	return d.name + ind;
      })
      .style("fill-opacity", 1e-6);

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
      .attr("r", 7)
      .style("fill", function(d) { 
        return d.ind ? mycolours[Math.floor(d.ind)] : "lightgray"; 
      })
      .style("stroke", function(d) {
	  return "black";
      });

  nodeUpdate.select("text")
      .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position. '
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

  // Enter any new links at the parent's previous position. '
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

  // Transition exiting nodes to the parent's new position. '
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
      var mydiv = d3.select("div#details-box-project");

      mydiv.text("");

      var ptitle = mydiv.append('p');
      ptitle.classed("title", true);
      var mytitlehtml = d.type.charAt(0).toUpperCase() + d.type.slice(1) + ": " + mynode.name + " (" + mynode.mnemo + ")";
      mytitlehtml += ' &nbsp; <a href="/documentation/metrics.html#' + mynode.mnemo + '">More info <i class="fa fa-external-link"></i></a>';
      ptitle.html(mytitlehtml); 
  
      p = mydiv.append('p');
      p.classed("details", true); 
      p.html('<div class="row"><div class="col-sm-6"><b>Active:</b> ' + mynode.active.charAt(0).toUpperCase() + mynode.active.slice(1) + ' &nbsp; </div><div class="col-sm-6"><b>Value:</b> ' + d.value + '</div></div>');

      p = mydiv.append('p');
      p.classed("details", true); 
      var mycolour = d.ind ? mycolours[Math.floor(d.ind)] : "gray";
      p.html('<div class="row"><div class="col-sm-6"><b>Data source</b>: ' + mynode.datasource + ' &nbsp; </div><div class="col-sm-6"><b>Computed indicator:</b> <span class="label label-scale" style="background-color: ' + mycolour + '"> ' + d.ind + " </span></div></div>");

      pdesct = mydiv.append('p');
      pdesct.classed("details", true); 
      pdesct.html("<b>Description</b>:")
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

      var mydiv = d3.select("div#details-box-project");

      mydiv.text("");

      var ptitle = mydiv.append('p');
      ptitle.classed("title", true);
      mytitlehtml = d.type.charAt(0).toUpperCase() + d.type.slice(1) + ": " + mynode.name + " (" + mynode.mnemo + ")";
      mytitlehtml += ' &nbsp; <a href="/documentation/questions.html#' + mynode.mnemo + '">More info <i class="fa fa-external-link"></i></a>';
      ptitle.html(mytitlehtml); 
  
      p = mydiv.append('p');
      p.classed("details", true); 
      var mycolour = d.ind ? mycolours[Math.floor(d.ind)] : "gray";
      p.html('<div class="row"><div class="col-sm-6"><b>Active:</b> ' + mynode.active.charAt(0).toUpperCase() + mynode.active.slice(1) + ' &nbsp; </div><div class="col-sm-6"><b>Value:</b> <span class="label label-scale" style="background-color: ' + mycolour + '"> ' + d.ind + " </span></div></div>");

      pdesct = mydiv.append('p');
      pdesct.classed("details", true); 
      pdesct.html("<b>Question:</b><br />" + mynode.question);
      
      pdesct = mydiv.append('p');
      pdesct.classed("details", true); 
      pdesct.html("<b>Description:</b>")
      for (desc_idx = 0 ; desc_idx < mynode.description.length ; desc_idx++) {
          var pdesc = mydiv.append('p');
          pdesc.classed("details", true);
          pdesc.html(mynode.description[desc_idx]);
      }
    } else if (d.type == "attribute") {
      mynode = d;
      mynode.description = myattrs[d.mnemo]["desc"]; 
      mynode.name = myattrs[d.mnemo]["name"]; 

      var mydiv = d3.select("div#details-box-project");

      mydiv.text("");

      var ptitle = mydiv.append('p');
      ptitle.classed("title", true);
      mytitlehtml = d.type.charAt(0).toUpperCase() + d.type.slice(1) + ": " + mynode.name + " (" + mynode.mnemo + ")";
      mytitlehtml += ' &nbsp; <a href="/documentation/attributes.html#' + mynode.mnemo + '">More info <i class="fa fa-external-link"></i></a>';
      ptitle.html(mytitlehtml); 
  
      p = mydiv.append('p');
      p.classed("details", true); 
      var mycolour = d.ind ? mycolours[Math.floor(d.ind)] : "gray";
      p.html('<div class="row"><div class="col-sm-6"><b>Active:</b> ' + mynode.active.charAt(0).toUpperCase() + mynode.active.slice(1) + ' &nbsp; </div><div class="col-sm-6"><b>Value:</b> <span class="label label-scale" style="background-color: ' + mycolour + '"> ' + d.ind + ' </span></div></div>');      

      pdesct = mydiv.append('p');
      pdesct.classed("details", true); 
      pdesct.html("<b>Description:</b>")
      for (desc_idx = 0 ; desc_idx < mynode.description.length ; desc_idx++) {
          var pdesc = mydiv.append('p');
          pdesc.classed("details", true);
          pdesc.text(mynode.description[desc_idx]);
      }
    
    }
  }
}

</script>
</div>
<div class="col-lg-5">
<div id="details-box-project"><p>Click on a node to get more details.</p></div>
</div> <!-- col -->
</div> <!-- row -->
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
