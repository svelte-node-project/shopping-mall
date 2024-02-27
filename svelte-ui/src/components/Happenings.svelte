<script>
    import Card from "../components/Card.svelte";
    import { onMount } from 'svelte';
    import { getHappenings } from '../http-actions/happenings-api.js';
  
    let happenings = $state([]);
    let updatedHappenings = $state([]);
    let chunkedHappenings = $state([]);

    onMount(async () => {
      happenings = await getHappenings();

      updatedHappenings = happenings.map(h => {
      const parts = h.title.split('| ')
      const name = parts[0]
      const details = parts[1]

      return {...h, name, details }
    });

    function chunkArray(array, chunkSize) {
      let result = [];
      for (let i = 0; i < array.length; i += chunkSize) {
        result.push(array.slice(i, i + chunkSize));
      }
      return result;
    }

    chunkedHappenings = chunkArray(updatedHappenings, 3);
    });
    
  </script>
  
  <p class="header" style="color: #266D85; background-color: #DED5CC; padding: 20px">Happenings&nbsp</p>
  {#each chunkedHappenings as chunk}
  <div class="flex justify-left mt-10 mb-12 space-x-20 pl-16">
    {#each chunk as h}
      <Card title={h.name} description={h.details} link={`/happenings/${h.id}`} image={h.image_link} />
    {/each}
  </div>
{/each}
