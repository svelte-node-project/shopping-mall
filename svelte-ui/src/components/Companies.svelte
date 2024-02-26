<script>
    import { onMount } from "svelte";
    import { getFormattedWorkingHours } from "../helpers/workingHoursHelper.js"

    let stores = $state([]);
    let searchValue = $state("");
    let allStores;

    const getAllStores = async () => {
        // const result = await fetch("http://localhost:3001/companies?types=tenant&group=true&full=true");
        const result = await fetch("http://localhost:3001/companies?group=true&full=true");
        allStores = await result.json();
        stores = [...allStores];
    };

    const getWorkingHoursToday = (workingHours) => {
        const result = getFormattedWorkingHours(workingHours, true)[0];
        return result ? result.formatted : "Closed";
    };

    const filterByCategory = () => {
        

    };
 
    const filterByFloor = () => {

    };

    const filterStores = (event) => {
        stores = allStores.map(el => (
            {
                letter: el.letter,
                companies: [...el.companies].map(el => el).filter(c => c.name.toLowerCase().startsWith(searchValue.toLocaleLowerCase()))
            }
        )).filter(el => el.companies.length > 0);
    };
 
    onMount(getAllStores);
</script>

<h1>Stores</h1>

<button type="button" on:click={filterByCategory}>By category</button>
<button type="button" on:click={filterByFloor}>By floor</button>
<input type="search" on:click={filterByCategory} placeholder="Search" on:keyup={filterStores} bind:value={searchValue} />
{searchValue}

{#each stores as store}
    <h2>{store.letter}</h2>
    {#each store.companies as company}
        <div>
            <h3><a href="#">{company.name}</a></h3>
            <!-- <p>{company.description}</p> -->
            {company.categories.join(` ${String.fromCharCode(0x00B7)} `)}
            {#if company.locations}
                <p>Level {company.locations[0].level}</p>
            {/if}

            <p>Today: <strong>{getWorkingHoursToday(company.working_hours)}</strong></p>
        </div>
        
    {/each}
{/each}