// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });

    $('.collapsible').collapsible({
      accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });
});


var map_options = {
   center: new google.maps.LatLng(//start_lattitude(activity), start_longitude(activity)),
   zoom: 16,
   mapTypeId: google.maps.MapTypeId.ROADMAP,
   panControl: false,
   mapTypeControl: false,
   zoomControlOptions: { position: google.maps.ControlPosition.LEFT_CENTER }
};
 
var map = new google.maps.Map(document.getElementById("map-canvas"), map_options);

var polyOptions = {
  strokeColor: '#5e96d9',
  strokeOpacity: 0.8,
  strokeWeight: 6
}
 
var poly = new google.maps.Polyline(polyOptions);
poly.setMap(map);


var polylineSummary = //<%= summary_polyline(activity) %>
poly.setPath(polylineSummary);