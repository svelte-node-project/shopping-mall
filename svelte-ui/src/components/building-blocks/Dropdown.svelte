<script>
    let { list, searchBy } = $props();

    const updateSearchBy = (item) => {
        return () => {
            searchBy = item;
            return searchBy;
        }
    }

</script>


<div class = "dropdown">
    {#each list as item}
        <button type="button" on:click={updateSearchBy(item.value)}>{item.name}</button>
    {/each}
</div>


<style>
    .dropdown {
        display: flex;
        flex-direction: column;
        position: absolute;
        overflow: auto;
        cursor: pointer;
        width: inherit;
    }    
</style>