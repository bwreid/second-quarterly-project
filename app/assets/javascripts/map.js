function highlight_selected(job) {
  $('.job').removeClass('highlighted');
  $(this).addClass('highlighted');
}

function add_marker(lat, long, title){
  var latlng = new google.maps.LatLng(lat, long);
  var marker = new google.maps.Marker({position: latlng, map: map, title: title});
}

function display_map(lat, long, zoom) {
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
}