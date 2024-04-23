<script>
    import { onMount } from "svelte";
    import Dropdown from "./Dropdown.svelte";

    let { type, value=$bindable() , defaultName , showOptions} = $props();
    
    let options = $state([]);

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

  //  let showOptions = $state(false);

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
                    ?.map(el => ({ name: el[params[type].field], value: el[params[type].field] }))
            ];
        
        }
    };
  

    onMount(init);
 
</script>

<svelte:window on:click={closeOptions} on:keyup={closeOptions}/> 

<div class = "filter">
    {#if type === "text"}
    <div class="relative text-gray-600 focus-within:text-gray-400">
        <span class="absolute inset-y-0 left-0 flex items-center pl-2">
            <button type="submit" class="p-1 focus:outline-none focus:shadow-outline">
                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" class="w-6 h-6">
                    <path d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
            </button>
        </span>
        <input bind:value={value} type="search" name="q" class="py-2 text-sm text-gray-900 bg-white rounded-t-md pl-10 focus:outline-none focus:border-b focus:border-gray-400" placeholder="Search..." autocomplete="off">
    </div>
    
        
        

    {:else}        
         <Dropdown defaultName={defaultName} options={options} showOptions={showOptions} bind:value={value} />    
    {/if}
</div>


<style>
    .filter {
        width: 90%;
    }

</style>