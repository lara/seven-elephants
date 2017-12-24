var autocomplete

function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete(
      (document.getElementById('autocomplete_address')),
      {types: ['geocode']})

  autocomplete.addListener('place_changed', fillInAddress)
}

function fillInAddress() {
  var address_field = document.getElementById('address')
  var place = autocomplete.getPlace()
  address_field.value = place.formatted_address
}
