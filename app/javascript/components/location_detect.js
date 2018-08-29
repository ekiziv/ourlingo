function storeLatAndLong(lat,lng) {
  search_lat = document.getElementById("search_lat");
  search_lng = document.getElementById("search_lng");
  search_lat.innerHTML = lat;
  search_lng.innerHTML = lng;
}

function ipLookUp () {
  $.ajax('http://ip-api.com/json')
  .then(
      function success(response) {
        storeLatAndLong(response.lat, response.lon);
      },

      function fail(data, status) {
        console.log('Request failed.  Returned status of', status);
      }
  );
}

const form_element = document.getElementById("search_place");
if (form_element != null) {
  form_element.addEventListener("submit", (event) => {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(
        function success(position) {
          storeLatAndLong(position.coords.latitude, position.coords.longitude);
        },
        function error(error_message) {
          ipLookUp()
        }
        );
    } else {
      console.log('geolocation is not enabled on this browser')
      ipLookUp()
    }
  });
}




