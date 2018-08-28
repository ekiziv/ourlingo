import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');

if (mapElement) {
  const map = new GMaps({
    el: '#map',
    lat: 0,
    lng: 0
  });

  const markers = JSON.parse(mapElement.dataset.markers);


  markers.forEach(marker => {
    const mapMarker = map.addMarker(marker);
    mapMarker.addListener('click',
      () => {
        const card = document.getElementById(marker.card_id);
        const cardParent = card.parentElement;
        console.log(card);
        cardParent.classList.add('highlighted');
        setTimeout(() => {cardParent.classList.remove('highlighted')}, 1000);
        window.smoothScrollTo(cardParent)
      }
    )
  })



  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

autocomplete();
