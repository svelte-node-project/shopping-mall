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
  
  <p class="header">Happenings&nbsp</p>
  <div class="flex justify-evenly mt-10 mb-10">
    <Card title="MOOMIN POP UP STORE" description="06.-07.04.2024, Center Court" link="/" image="/images/happenings1.png" />
    <Card title="COWORK" description="CoWork workspace is now open to everyone" link="/about" image="/images/happenings2.png" />
    <Card title="BIG DOUGHNUTS" description="Grand opening 01.04.2024" link="/contact" image="/images/happenings3.png" />
  </div>