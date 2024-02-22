<script>
    import Card from "../components/Card.svelte";

    /*
    import { onMount } from 'svelte';
    import { getOffers } from '../http-actions/homepage-api.js';
  
    let offers = $state([]);
  
    onMount(async () => {
      offers = await getOffers();
    });*/
    
  </script>
  <!--
  <ul>
    {#each offers as offer}
      <li>{offer.name}</li>
    {/each}
  </ul>
  -->

  <div class="bg-gray-300" style="padding-bottom: 10px;">
    <p class="header">
      <b>Offers&nbsp</b>
      <a class="view-all-link" href="/offers">View all</a>
    </p>
    <div class="flex justify-evenly mt-10 mb-10">
      <Card title="LUMENE - VALID 01.-07.04.2024" description="20% off all products for member only" link="/" image="/images/offer1.png" />
      <Card title="STARBUCKS - VALID 11.04.2024" description="Buy 1 free 1" link="/about" image="/images/offer2.png" />
      <Card title="TECTOR" description="Start from €1399 Normal price from €1499" link="/contact" image="/images/offer3.png" />
    </div>
  </div>
  
  <p class="header">
    <b>Happenings&nbsp</b>
    <a class="view-all-link" href="/happenings">View all</a>
  </p>
  <div class="flex justify-evenly mt-10 mb-10">
    <Card title="MOOMIN POP UP STORE" description="06.-07.04.2024, Center Court" link="/" image="/images/happenings1.png" />
    <Card title="COWORK" description="CoWork workspace is now open to everyone" link="/about" image="/images/happenings2.png" />
    <Card title="BIG DOUGHNUTS" description="Grand opening 01.04.2024" link="/contact" image="/images/happenings3.png" />
  </div>