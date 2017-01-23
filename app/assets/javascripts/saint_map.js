// $(document).on("ready", function() {
//   mapboxgl.accessToken = 'pk.eyJ1Ijoic2FpbnRqb3VybmFsIiwiYSI6ImNpeTJqbzZzNzAwM2QycWxhenpubDJ6eTMifQ.z-C8BCVYHRlcct2jAYk9aA';
//   var map = new mapboxgl.Map({
//     container: 'map', // container id
//     style: 'mapbox://styles/mapbox/streets-v9', //stylesheet location
//     center: [12.496, 41.9028], // starting position
//     zoom: 2 // starting zoom
//   });
//   // map.featureLayer.on("ready", function(e) {
//   //   getSaints(map);
//   // });
// });

// $(document).on("ready", function() {
//   mapboxgl.accessToken = 'pk.eyJ1Ijoic2FpbnRqb3VybmFsIiwiYSI6ImNpeTJqbzZzNzAwM2QycWxhenpubDJ6eTMifQ.z-C8BCVYHRlcct2jAYk9aA';
//   var map = new mapboxgl.Map({
//       container: 'map', // container id
//       style: 'mapbox://styles/mapbox/streets-v9', //stylesheet location
//       center: [-74.50, 40], // starting position
//       zoom: 9 // starting zoom
//   });
// });

// function getSaints(map) {
//   $.ajax({
//     dataType: 'text',
//     url: '/map.json',
//     success: function(data) {
//       var geojson;
//       geojson = $.parseJSON(data);
//       return map.featureLayer.setGeoJSON(geojson);
//     }
//   });
// };

// function getSaints(map) {
//   var $wheel = $("#spinning-wheel")
//   $wheel.show();
//   $.ajax({
//     dataType: 'text',
//     url: '/map.json',
//     success:function(saints) {
//       $wheel.hide();
//       var geojson = $.parseJSON(saints)["saints"];
//       map.featureLayer.setGeoJSON({
//         type: "FeatureCollection",
//         features: geojson
//       });
//       addSaintPopups(map);
//     },
//     error:function() {
//       $wheel.hide();
//       alert("There are no saints today.");
//     }
//   });
// };

// function addSaintPopups(map) {
//   map.featureLayer.on("layeradd", function(e){
//     var marker = e.layer;
//     var properties = marker.feature.properties;
//     var popupContent = '<div class="event-popup">''<h3>' + properties.name + '</h3>' + '</div>';
//     marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
//   });
// };

// function getSaints(map) {
//   var $loading_wheel = $("#spinning-wheel")
//   $loading_wheel.show();
//   $.ajax({
//     dataType: 'text',
//     url: '/saint_map.json',
//     success:function(saints) {
//       $loading_wheel.hide();
//       var geojson = $.parseJSON(saints);
//       map.featureLayer.setGeoJSON({
//         type: "FeatureCollection",
//         features: geojson
//       });
//       addSaintPopups(map);
//     },
//     error:function() {
//       $loading_wheel.hide();
//       alert("Could not load the saints");
//     }
//   });
// }

// function addSaintPopups(map) {
//   map.featureLayer.on("layeradd", function(e){
//     var marker = e.layer;
//     var properties = marker.feature.properties;
//     var popupContent = '<div class="marker-popup">' + '<h3>' + properties.title + '</h3>' +
//                        '<h4>' + properties.address + '</h4>' + '</div>';
//     marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
//   });
// }
