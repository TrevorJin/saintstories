$(document).on("ready", function() {
	handler = Gmaps.build('Google');
	handler.buildMap({ 
	  provider: {
	    center: {lat: 41.9028, lng: 12.4964},
	    zoom: 4
	  },
	  internal: { 
	    id: 'sidebar_builder'
	  }
	},
	function(){

	  // var markers = handler.addMarkers(decodeHtml(this.getAttribute("data-markers"));
	  	var markers = handler.addMarkers(gon.my_hash);
	  	var birth_button = document.getElementById('birth_option');
	  	var death_button = document.getElementById('death_option');

	  	// return google.maps.event.addListener(handler.getMap(), 'bounds_changed', function() {
    // 		return console.log(handler.getMap().getBounds().getNorthEast().toString());
  		// });
	});
})
