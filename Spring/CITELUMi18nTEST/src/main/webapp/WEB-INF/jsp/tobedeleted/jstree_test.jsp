<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>jsTree test</title>
  <!-- 2 load the theme CSS file -->
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/themes/default/style.min.css" />
</head>
<body>
  <!-- 3 setup a container element -->
  <div id="jstree">
    <!-- in this example the tree is populated from inline HTML -->
    <ul>
      <li>Root node 1
        <ul>
          <li id="child_node_1">Child node 1</li>
          <li>Child node 2</li>
        </ul>
      </li>
      <li>Root node 2</li>
    </ul>
  </div>
  <button id = "demo_button">demo button</button>
  <button id = "JSON_button">JSON button 2</button>

  <!-- 4 include the jQuery library -->
<!-- jQuery core 3.2.1 -->    
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <!-- 5 include the minified jstree source -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
  <script>
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree({
	    	"core" : {
    	    "animation" : 0,
    	    "check_callback" : true,
    	    "themes" : { "stripes" : true },
    	    },
    	    "plugins" : [
	    	    "dnd", "search",
	    	    "state", "types", "wholerow", "checkbox", "sort", "contextmenu", "unique"
	    	  ]
    	    });
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
      var myJflat = $('#jstree').jstree().get_json('#', {flat:true});
      console.log("flat: ");
      console.log(myJflat);
      
      var myJ = $('#jstree').jstree().get_json('#', {flat:false});
      console.log("unflat: ");
      console.log(myJ);
      
      var mytext = JSON.stringify(myJ);
      alert(mytext);
    });
    
    
  });
  </script>
</body>
</html>