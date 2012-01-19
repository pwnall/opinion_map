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
