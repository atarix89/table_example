$(document).ready(function() {
  $("#switchDB1").click(function(event) {
    $.ajax({
      type: "GET",
      url:    "/connect_db1", // should be mapped in routes.rb
    }); 
  }); 
    $("#switchDB2").click(function(event) {
    $.ajax({
      type: "GET",
      url:    "/connect_db2", // should be mapped in routes.rb
    }); 
  }); 
    $("#switchDB3").click(function(event) {
    $.ajax({
      type: "GET",
      url:    "/connect_db3", // should be mapped in routes.rb
    }); 
  }); 
});