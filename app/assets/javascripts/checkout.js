var autocomplete

function initAutocomplete () {
  autocomplete = new google.maps.places.Autocomplete(
      (document.getElementById('autocomplete_address')),
      {types: ['geocode']})

  autocomplete.addListener('place_changed', fillInAddress)
}

function fillInAddress () {
  var placeIdField = document.getElementById('place_id')
  var place = autocomplete.getPlace()
  placeIdField.value = place.place_id
  console.log(placeIdField)
}

/* global google */
