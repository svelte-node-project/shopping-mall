<script>
  import Card from "../components/Card.svelte";
  import { onMount } from 'svelte';
  import { getOffers } from '../http-actions/offers-api.js';

  let offers = $state([]);
  let updatedOffers = $state([]);
  let chunkedOffers = $state([]);

  onMount(async () => {
    initFlowbite();

    offers = await getOffers();

    updatedOffers = offers.map(offer => {
      const parts = offer.name.split('| ')
      const title = parts[0]
      const details = parts[1]

      return {...offer, title, details }
    });

    function chunkArray(array, chunkSize) {
      let result = [];
      for (let i = 0; i < array.length; i += chunkSize) {
        result.push(array.slice(i, i + chunkSize));
      }
      return result;
    }

    chunkedOffers = chunkArray(updatedOffers, 3);
  });
</script>
  
<div style="color: #266D85; background-color: #A9DBDB; padding: 20px">
  <p class="header">Offers&nbsp</p>  
</div>

{#each chunkedOffers as chunk}
  <div class="flex justify-left mt-10 mb-12 space-x-20 pl-16">
    {#each chunk as offer}
      <Card title={offer.title} description={offer.details} link={`/offers/${offer.id}`} image={offer.image_link} />
    {/each}
  </div>
{/each}


  
