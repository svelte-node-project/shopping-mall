<script>
    import { onMount } from "svelte";
    import Dropdown from "./Dropdown.svelte";

    let { type, value, defaultName } = $props();
    let options;

    const params = {
        "category": {
            link: "http://localhost:3001/categories",
            field: "name"
        },
        "floor": {
            link: "http://localhost:3001/locations?floors_only=true",
            field: "level"
        }
    };

    let showOptions = $state(false);

    const updateShowOptions = () => {
        showOptions = !showOptions;
    };

    const closeOptions = () => {
        showOptions = false;
    };

    const init = async () => {
        if (type !== "text") {
            const result = await fetch(params[type].link);
            options = [
                { name: "All", value: ""},
                ...(await result.json())
                    .map(el => ({ name: el[params[type].field], value: el[params[type].field] }))
            ];
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
            <Dropdown options={options} bind:showOptions={showOptions} bind:value={value} />
        {/if}    
    {/if}
</div>


<style>
    .filter {
        width: 90%;
    }

    .filter button, input {
        width: 100%;
        padding: 0;
    }
</style>