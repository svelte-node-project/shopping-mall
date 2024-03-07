<script>
  import Card from "../components/Card.svelte";
  import { onMount } from 'svelte';
  import { getOffers } from '../http-actions/offers-api.js';

  let offers = $state([]);
  let updatedOffers = $state([]);
  let chunkedOffers = $state([]);
  let filterText = $state('');

  function chunkArray(array, chunkSize) {
    let result = [];
    for (let i = 0; i < array.length; i += chunkSize) {
      result.push(array.slice(i, i + chunkSize));
    }
    return result;
  }

  onMount(async () => {
    offers = await getOffers();

    updatedOffers = offers.map(offer => {
      const parts = offer.name.split('| ')
      const title = parts[0]
      const details = parts[1]

      return {...offer, title, details }
    });

    chunkedOffers = chunkArray(updatedOffers, 3);
  });

  const filter = () => {
    updatedOffers = (offers.filter(offer => offer.name.toLowerCase().includes(filterText.toLowerCase()))).map(offer => {
      const parts = offer.name.split('| ')
      const title = parts[0]
      const details = parts[1]

      return {...offer, title, details }
    });
    
    chunkedOffers = chunkArray(updatedOffers, 3);
  }
</script>
  
<div style="color: #266D85; background-color: #A9DBDB; padding: 20px">
  <a href="/">HOME</a> / OFFERS
  <p class="header">Offers&nbsp</p>  
  <div style="padding-left: 30px; padding-bottom:30px; padding-top:10px;">
    <label class="input input-bordered flex items-center gap-2 w-1/2">
      <input type="text" class="grow input" placeholder="Search" bind:value={filterText} on:keyup={filter} />
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path fill-rule="evenodd" d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z" clip-rule="evenodd" /></svg>
    </label>
  </div>
</div>

{#each chunkedOffers as chunk}
  <div class="flex justify-left mt-10 mb-12 space-x-20 pl-16">
    {#each chunk as offer}
      <Card title={offer.title} description={offer.details} link={`/offers/${offer.id}`} image={offer.image_link} />
    {/each}
  </div>
{/each}


  
