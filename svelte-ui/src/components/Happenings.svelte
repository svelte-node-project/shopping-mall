<script>
    import Card from "../components/Card.svelte";
    import { onMount } from 'svelte';
    import { getHappenings } from '../http-actions/happenings-api.js';
  
    let happenings = $state([]);
    let updatedHappenings = $state([]);
    let chunkedHappenings = $state([]);
    let filterText = $state('');

    function chunkArray(array, chunkSize) {
      let result = [];
      for (let i = 0; i < array.length; i += chunkSize) {
        result.push(array.slice(i, i + chunkSize));
      }
      return result;
    }

    onMount(async () => {
      happenings = await getHappenings();

      updatedHappenings = happenings.map(h => {
        const parts = h.title.split('| ')
        const name = parts[0]
        const details = parts[1]

        return {...h, name, details }
    });

      chunkedHappenings = chunkArray(updatedHappenings, 3);
    });
    
    const filter = () => {
      updatedHappenings = (happenings.filter(h => h.title.toLowerCase().includes(filterText.toLowerCase()))).map(h => {
        const parts = h.title.split('| ')
        const name = parts[0]
        const details = parts[1]

        return {...h, name, details }
      });
      
      chunkedHappenings = chunkArray(updatedHappenings, 3);
    }
  </script>
  
  <div style="color: #266D85; background-color: #DED5CC; padding: 20px">
    <a href="/">HOME</a> / HAPPENINGS
    <p class="header">Happenings&nbsp</p>  
    <div style="padding-left: 30px; padding-bottom:30px; padding-top:10px;">
      <label class="input input-bordered flex items-center gap-2 w-1/2">
        <input type="text" class="grow input" placeholder="Search" bind:value={filterText} on:keyup={filter} />
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path fill-rule="evenodd" d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z" clip-rule="evenodd" /></svg>
      </label>
    </div>
  </div>

  {#each chunkedHappenings as chunk}
  <div class="flex justify-left mt-10 mb-12 space-x-20 pl-16">
    {#each chunk as h}
      <Card title={h.name} description={h.details} link={`/happenings/${h.id}`} image={h.image_link} />
    {/each}
  </div>
{/each}
