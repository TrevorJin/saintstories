function createMarkers(gon_hash) {
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
    var markers = handler.addMarkers(gon_hash);
  });
}

// var handler;
// var map;

// $(document).on("ready", function() {
// 	handler = Gmaps.build('Google');
// 	handler.buildMap({ 
// 	  provider: {
// 	    center: {lat: 41.9028, lng: 12.4964},
// 	    zoom: 4
// 	  },
// 	  internal: { 
// 	    id: 'sidebar_builder'
// 	  }
// 	},
// 	function(){
// 	  	var markers = handler.addMarkers(gon.my_hash);
// 	});

// 	map = handler.getMap();
// })



// $('#myButtons').on('click', function (e) {

//    alert('Foo');

// })

// $('.btn-primary').on('click', function(){
//     alert('Foo');
//     // alert($(this).find('input').attr('id'));

//     // if ($(this).find('input').attr('id') == 'death_option') {
//     // 	alert('Foo');
//     // }
// }); 

// $("#myButtons :input").change(function() {
//     // console.log(this); // points to the clicked input button

//     if ($(this).attr('id') == 'death_option') {
//     	handler.removeMarkers(gon.my_hash)
//     }
// });

// $('.controls').find('input').bind('click',function(event){
//   if($(this).attr('id')==='optionsRadios1'){
//     alert($(this).attr('id'));
//   } else {
//     //... call some other function
//   }
// });

// $('#death_option').on('click', function(event) {
//   event.preventDefault(); // To prevent following the link (optional)
  
//   var birth_markers = handler.removeMarkers(gon.my_hash);
//   var death_markers = handler.addMarkers(gon.their_hash);

// });
