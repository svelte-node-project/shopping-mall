<script>
    import SingleSearchParam from "./SingleSearchParam.svelte";

    const { searchParams } = $props();
    const columns = 4;
    // console.log(searchParams.category)
    let colIndex = 0;

</script>

<div class="search-panel row">
    {#if searchParams.hasOwnProperty("category")}
        <div class="col">
            <SingleSearchParam type="category" bind:value={searchParams.category} defaultName="By category" />
        </div>
        <!-- {colIndex += colIndex} -->
    {/if}
    {#if searchParams.hasOwnProperty("category")}
        <div class="col">
            <SingleSearchParam type="category" bind:value={searchParams.category} defaultName="By category" />
        </div>
        <!-- {colIndex += colIndex} -->
    {/if}

    <!-- <div class = "filter">
        <button type="button" on:click|stopPropagation={filterByFloor}>{floor === "" ? "By floor" : floor}</button>
        {#if showFloors}
            <Dropdown list={floors} bind:searchBy={floor} />
            {filterStores()}
        {/if}
        

    </div> -->

    {#if searchParams.hasOwnProperty("text")}
        <div class="col">
            <SingleSearchParam type="text" bind:value={searchParams.text} defaultName="" />
        </div>
        <!-- {colIndex += colIndex} -->
    {/if}
</div>


<style>
    .search-panel {
        display: flex;
        flex-direction: row;
        /* justify-content: space-between; */
    }

    .col {
        width: 25%;
    }
</style>