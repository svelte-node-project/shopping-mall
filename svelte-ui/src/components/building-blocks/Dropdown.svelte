<script>
    const { list } = $props();
</script>

<div class = "dropdown">
    {#each list as item}
        <button on:click={item.onClick}>item.name</button>
    {/each}
</div>