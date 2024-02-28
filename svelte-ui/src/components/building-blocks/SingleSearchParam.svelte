<script>
    import { onMount } from "svelte";
    import Dropdown from "./Dropdown.svelte";


    let { type, value, defaultName } = $props();
    let options;

    const fetchLinks = {
        "category": "http://localhost:3001/categories",
    };

    const fieldName = {
        "category": "name",
        "floor": "level"
    };

    let showOptions = $state(false);

    const updateShowOptions = () => {
        showOptions = !showOptions;
        // console.log("***************")
        // console.log(showOptions)
    };

    const closeOptions = () => {
        showOptions = false;
    };

    const init = async () => {
        if (type !== "text") {
            const result = await fetch(fetchLinks[type]);
            options = [
                { name: "All", value: ""},
                ...(await result.json())
                    .map(el => ({ name: el[fieldName[type]], value: el[fieldName[type]] }))
            ];
            // console.log("!!!!!!!!!");
            // console.log(options);
        }
    };

    onMount(init);
</script>

<svelte:window on:click={closeOptions} on:keyup={closeOptions}/> 

<div class = "filter">
    {#if type === "text"}
        <input type="search" placeholder="Search" bind:value={value} />
    {:else}        
        <button type="button" on:click|stopPropagation={updateShowOptions}>{value === "" ? defaultName : value}</button>
        {#if showOptions}
            <!-- <Dropdown type={type} fetchFrom={fetchLinks[type]} bind:value={value} /> -->
            <Dropdown options={options} bind:showOptions={showOptions} bind:value={value} />
        {/if}    
    {/if}
</div>


<style>
    .filter {
        width: 25%;
    }

    .filter button {
        width: 100%;
        /* padding: 0;
        margin: 0; */
    }
</style>