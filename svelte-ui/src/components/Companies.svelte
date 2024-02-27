<script>
    import { onMount } from "svelte";
    import { getFormattedWorkingHours } from "../helpers/workingHoursHelper.js";
    import Dropdown from "./building-blocks/Dropdown.svelte";

    const { link }= $props();
    let stores = $state([]);
    let categories = [];
    let floors = [];
    let searchValue = $state("");
    let category = $state("");
    let floor = $state("");
    let allStores = [];
    let showCategories = $state(false);
    let showFloors = $state(false);

    const init = async () => {
        const time1 = Date.now();

        // const result = await fetch("http://localhost:3001/companies?types=tenant&group=true&full=true");
        let result = await fetch("http://localhost:3001/companies?group=true&full=true");
        
        const time2 = Date.now();
        console.log(`Fetch to companies: ${time2 - time1}`);


        allStores = await result.json();
        console.log(allStores)
        stores = [...allStores];

        const time3 = Date.now();
        console.log(`Stores array: ${time3 - time2}`);
        

        result = await fetch("http://localhost:3001/categories");

        const time4 = Date.now();
        console.log(`Fetch to categories: ${time4 - time3}`);

        categories = [{ name: "All", value: ""}, ...(await result.json()).map(el => ({ name: el.name, value: el.name }))];

        const time5 = Date.now();
        console.log(`Categories array: ${time5 - time4}`);

    };

    const getWorkingHoursToday = (workingHours) => {
        const result = getFormattedWorkingHours(workingHours, true)[0];
        return result ? result.formatted : "Closed";
    };

    const filterByCategory = () => {
        showCategories = !showCategories;
    };
 
    const filterByFloor = () => {

    };

    const closeDropdowns = () => {     
        showCategories = false;
    }

    const getFilteredStoresList = (catName, txt) => {
        return allStores.map(el => (
                {
                    letter: el.letter,
                    companies: [...el.companies].filter(company => (
                        (category ? company.categories.some(cat => cat.name === catName) : true)
                        &&
                        company.name.toLowerCase().includes(txt.toLocaleLowerCase())
                    ))
                }
            )).filter(el => el.companies.length > 0);
    };

    const categoryFilter = $derived(category);
    const textFilter = $derived(searchValue);

    $effect(() => {
        stores = getFilteredStoresList(categoryFilter, textFilter);
    });
 
    onMount(init);
</script>

<svelte:window on:click={closeDropdowns} on:keyup={closeDropdowns}/> 



<h1>Stores</h1>

<div class = "filter">
    <button type="button" on:click|stopPropagation={filterByCategory}>{category === "" ? "By category" : category}</button>
    {#if showCategories}
        <Dropdown list={categories} bind:searchBy={category} />
        
    {/if}
</div>
<!-- <div class = "filter">
    <button type="button" on:click|stopPropagation={filterByFloor}>{floor === "" ? "By floor" : floor}</button>
    {#if showFloors}
        <Dropdown list={floors} bind:searchBy={floor} />
        {filterStores()}
    {/if}
    
</div> -->


<input type="search" on:click={filterByCategory} placeholder="Search" bind:value={searchValue} />


{#each stores as store}
    <h2>{store.letter}</h2>
    {#each store.companies as company}
        <div>
            <h3><a href="{link}/{company.categories[0].name_in_url}/{company.name_in_url}">{company.name}</a></h3>
            <p>
                {company.categories[0].name}
                {#if company.locations}
                    {String.fromCharCode(0x00B7)} {company.locations[0].level}
                {/if}
            </p>
            <p>Today: <strong>{getWorkingHoursToday(company.working_hours)}</strong></p>
        </div>
        
    {/each}
{/each}


<style>
    .filter {
        width: 20%;
    }

    .filter button {
        width: 100%;
    }
</style>