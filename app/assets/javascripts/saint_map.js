var ready;
ready = function() {
  handler = Gmaps.build('Google');
	handler.buildMap({ 
	  provider: {
	    center: {lat: 41.9028, lng: 12.4964},
	    zoom: 4
	  },
  	internal: { 
    	id: 'sidebar_builder'
  	}
	}, function(){
  	var markers = handler.addMarkers(<%=raw @hash.to_json %>);
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);

// $(document).on('turbolinks:load', function() {
// 	handler = Gmaps.build('Google');
// 	handler.buildMap({ 
// 	  provider: {
// 	    center: {lat: 41.9028, lng: 12.4964},
// 	    zoom: 4
// 	  },
//   	internal: { 
//     	id: 'sidebar_builder'
//   	}
// 	}, function(){
//   	var markers = handler.addMarkers(<%=raw @hash.to_json %>);
// 	});
// });
