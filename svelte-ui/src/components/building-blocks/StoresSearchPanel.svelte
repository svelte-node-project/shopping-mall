<script>
    import SingleSearchParam from "./SingleSearchParam.svelte";

    const { searchParams } = $props();
</script>


<div class="search-panel row">
    {#if searchParams.hasOwnProperty("category")}
        <div class="col">
            <SingleSearchParam type="category" bind:value={searchParams.category} defaultName="By category" />
        </div>
    {/if}

    {#if searchParams.hasOwnProperty("floor")}
        <div class="col">
            <SingleSearchParam type="floor" bind:value={searchParams.floor} defaultName="By floor" />
        </div>
    {/if}

    {#if searchParams.hasOwnProperty("text")}
        <div class="col">
            <SingleSearchParam type="text" bind:value={searchParams.text} defaultName="" />
        </div>
    {/if}
</div>


<style>
    .search-panel {
        display: flex;
        flex-direction: row;
    }

    .col {
        width: 25%;
    }
</style>