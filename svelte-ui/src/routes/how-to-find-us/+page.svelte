<script>
  import Map from '../../components/Map.svelte';
  import LocationGuide from '../../components/LocationGuide.svelte';
</script>
  
  <svelte:head>
    <title>How to Find Us -Aurora</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2xasdx5zJ64p9EHteVAQbV3102QOD7zA&callback=initMap&v=weekly" async defer></script>
  </svelte:head>
  
  <LocationGuide />
  
  <Map center={{ lat: 60.1674, lng: 24.9426 }} zoom={10} mapId="4504f8b37365c3d0" />