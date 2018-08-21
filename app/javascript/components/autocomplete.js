function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var inputAddress = document.getElementById('input_address');

    if (inputAddress) {
      var autocomplete = new google.maps.places.Autocomplete(inputAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(inputAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
