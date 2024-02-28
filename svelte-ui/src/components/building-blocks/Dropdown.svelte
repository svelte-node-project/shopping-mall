<script>
    let { options, value, showOptions } = $props();

    const updateValueAndClose = (item) => {
        return () => {
            value = item;
            showOptions = !showOptions;
        };
    };
</script>


<div class = "dropdown">
    {#each options as item}
        <button type="button" on:click={updateValueAndClose(item.value)}>{item.name}</button>
    {/each}
</div>


<style>
    .dropdown {
        display: flex;
        flex-direction: column;
        cursor: pointer;
        position: absolute;
        overflow: auto;
        width: 22.2%;
        z-index: 99;
    }    
</style>