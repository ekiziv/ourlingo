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
        console.log("I am using ip-api");
        storeLatAndLong(response.lat, response.lon);
      },

      function fail(data, status) {
        console.log('Request failed.  Returned status of', status);
      }
  );
}

const form_element = document.getElementById("search_place");
if (form_element != null) {
  console.log("hello");
  form_element.addEventListener("submit", (event) => {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(
        function success(position) {
          console.log("I am using geolocation");
          storeLatAndLong(position.coords.latitude, position.coords.longitude);
        },
        function error(error_message) {
          console.error('An error has occured while retrieving location', error_message);
          ipLookUp()
        }
        );
    } else {
      console.log('geolocation is not enabled on this browser')
      ipLookUp()
    }
  });
}




