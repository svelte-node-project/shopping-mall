<script>
    import { onMount, tick } from 'svelte';
  
    export let center = { lat: 60.16304501417706, lng: 24.941244375605468 };
    export let zoom = 14;
    export let mapId = '4504f8b37365c3d0';
    const apiKey = 'AIzaSyC2xasdx5zJ64p9EHteVAQbV3102QOD7zA';
  
    let map;
    let mapLoaded = false;
  
    onMount(async () => {
      if (!window.google) {
        const script = document.createElement('script');
        script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&callback=initMap&v=weekly`;
        script.async = true;
        document.head.appendChild(script);
  
        window.initMap = async () => {
          await tick();
          loadMap();
        };
      } else {
        loadMap();
      }
    });
  
    async function loadMap() {
      const { Map, InfoWindow } = google.maps;
      const mapElement = document.getElementById('map');
  
      map = new Map(mapElement, {
        center,
        zoom,
        mapId,
      });
  
      const infoWindow = new InfoWindow();
      const markersData = [
        { lat: 60.1640, lng: 24.9422, title: 'Aurora' },
      ];
  
      markersData.forEach(({ lat, lng, title }) => {
        const marker = new google.maps.Marker({
          position: { lat, lng },
          map,
          title,
        });
  
        marker.addListener('click', () => {
          infoWindow.setContent(title);
          infoWindow.open(map, marker);
        });
      });
  
      mapLoaded = true;
    }
  </script>
  
  {#if mapLoaded}
    <div id="map" class="map-container"></div>
  {:else}
    <p>Loading map...</p>
  {/if}