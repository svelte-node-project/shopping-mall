<script>
    import SingleSearchParam from "./SingleSearchParam.svelte";

    const { searchParams } = $props();

    // console.log(searchParams.category)

</script>

{#if searchParams.hasOwnProperty("category")}
    <SingleSearchParam type="category" bind:value={searchParams.category} defaultName="By category" />
{/if}

<!-- <div class = "filter">
    <button type="button" on:click|stopPropagation={filterByFloor}>{floor === "" ? "By floor" : floor}</button>
    {#if showFloors}
        <Dropdown list={floors} bind:searchBy={floor} />
        {filterStores()}
    {/if}
    

</div> -->

{#if searchParams.hasOwnProperty("text")}
    <SingleSearchParam type="text" bind:value={searchParams.text} defaultName="" />
{/if}
<!-- <input type="search" on:click={filterByCategory} placeholder="Search" bind:value={searchValue} /> -->