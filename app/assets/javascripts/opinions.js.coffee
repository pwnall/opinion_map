# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  navigator.geolocation?.getCurrentPosition (position) ->
    lat = position.coords.latitude
    lng = position.coords.longitude
    geocoder = new google.maps.Geocoder
    geocoder.geocode {latLng: new google.maps.LatLng(lat, lng)}, (results) ->
      $('.location-input').val results[0].formatted_address

pins = []
window.addPin = (pin) -> pins.push pin

$ ->
  mapContainer = document.querySelector '#map-container'
  options = {
    zoom: 3,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: new google.maps.LatLng(38, -97)
  }
  map = mapContainer and new google.maps.Map(mapContainer, options)
  if map
    for pin in pins
      marker = new google.maps.Marker {
        map: map,
        position: new google.maps.LatLng(pin.lat, pin.lng),
        title: pin.name,
        animation: google.maps.Animation.DROP
      }
