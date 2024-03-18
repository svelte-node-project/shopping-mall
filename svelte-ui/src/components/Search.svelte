<script>
    import { onMount } from 'svelte';
    import { getSearchResult } from '../http-actions/homepage-api.js';


    let searchResult = $state([]);
    let filterText = $state('');
    let notFound = $state(false);

    const updateSearchResults = async (text) => {
        searchResult = await getSearchResult(text);
        notFound = searchResult.length === 0;
    }

    onMount(async () => {
        /*searchResult = [{id: 1, name: 'ESPRESSO HOUSE', description: 'Espresso House is a Swedish cafe chain that was founded in 1996.', link:'/companies/'},
            {id: 2, name: 'LEGO - GET A MY FIRST DUCK', description: 'Toddlers who love animal toys build and rebuild these colourful, easy-to-handle LEGO DUPLO bricks in many different ways to invent stories in which the cute duck swims, eats and sleeps.', link:'/offers/'},
            {id: 3, name: 'MOOMIN POP UP STORE', description: 'Visit Moomin pop-up shop at Aurora from 6 April 2024.', link:'/happenings/'}];*/

        const queryParams = new URLSearchParams(window.location.search);
        updateSearchResults(queryParams.get('searchText') || '')
    });

    const searchByKey = (event) => {
        if (event.key === 'Enter') {
            search();
        }
    }

    const search = async () => {
        updateSearchResults(filterText)
    }

    const firstParagraph = (htmlContent) => {
        const parser = new DOMParser();
        const doc = parser.parseFromString(htmlContent, "text/html");

        return doc.querySelector("p")?.textContent || "";
    }
        
</script>
    
<div style="color: #266D85; padding-left: 20vw; padding-top: 2vw; padding-bottom:4vw; padding-right: 20vw">
    <p style='font-size: 60px; font-weight: bold; padding-bottom: 2vw'>Search&nbsp</p>  
    <div>
        <label class="input input-bordered flex items-center gap-2">
        <input type="text" class="grow input" placeholder="Search" bind:value={filterText} on:keydown={searchByKey}  />
        <button on:click={search}>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path fill-rule="evenodd" d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z" clip-rule="evenodd" /></svg>
        </button>
        </label>
    </div>
</div>

{#if notFound}
    <div class='text-xl' style='padding-left: 20vw; padding-bottom: 4vw; padding-right: 20vw'>No results found.</div>
{:else}
    {#each searchResult as result}
        <div class='text-xl' style='padding-left: 20vw; padding-bottom: 4vw; padding-right: 20vw'>
            <p><a href='{result.link}'><u>{result.name.split('| ')[0]}</u></a></p>
            <p>{result.link.includes('happenings') ? firstParagraph(result.description) : result.description}</p>
        </div>
    {/each}
{/if}
    
  