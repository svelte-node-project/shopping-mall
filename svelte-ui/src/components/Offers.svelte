<script>
    import Card from "../components/Card.svelte";

    /*
    import { onMount } from 'svelte';
    import { getOffers } from '../http-actions/homepage-api.js';
  
    let offers = $state([]);
  
    onMount(async () => {
      offers = await getOffers();
    });*/

    const offers = [
      { id: 1, name: "HP and the Philosopher's Stone", pages: 200, isbn: "123" }
    ];
    
  </script>
  <!--
  <ul>
    {#each offers as offer}
      <li>{offer.name}</li>
    {/each}
  </ul>
  -->

  
<p class="header">Offers&nbsp</p>
<div class="flex justify-left mt-10 mb-12 space-x-20 pl-16">
    <Card title="LUMENE - VALID 01.-07.04.2024" description="20% off all products for member only" link="/" image="/images/offer1.png" />
    <Card title="STARBUCKS - VALID 11.04.2024" description="Buy 1 free 1" link="/about" image="/images/offer2.png" />
    <Card title="TECTOR" description="Start from €1399 Normal price from €1499" link="/contact" image="/images/offer3.png" />
</div>
<div class="flex justify-left mt-10 mb-10 space-x-20 pl-16">
  <Card title="BODY SHOP - VALID 01.-07.04.2024" description="20% off all products for member only" link="/" image="/images/offer4.png" />
  <Card title="SHOP 5" description="Offer 5" link="/contact" image="/images/offer5.png" />
</div>

  
