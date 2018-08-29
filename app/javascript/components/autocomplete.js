function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var inputAddress = document.getElementById('input_address');
    var inputAddr = document.getElementById('input_addr');

    if (inputAddress) {
      var autocomplete = new google.maps.places.SearchBox(inputAddress);
      google.maps.event.addDomListener(inputAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
    if (inputAddr) {
      var autocomplete = new google.maps.places.SearchBox(inputAddr);
      google.maps.event.addDomListener(inputAddr, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
