<script>
    let { defaultName, options, value=$bindable(), showOptions=$bindable() } = $props();

    const updateValueAndClose = (event) => {
        const selectedIndex = event.target.selectedIndex;
        value = options[selectedIndex].value;
        showOptions = !showOptions;
    };

</script>

<div class="dropdown">
    <select bind:value={value} on:change={updateValueAndClose}>
        {#each options as option}
        <option style="display: none;" value="" selected>{defaultName}</option>
            <option value={option.value}>{option.name}</option>
        {/each}
    </select>
</div>


<style>
    .dropdown {
        display: flex;
        flex-direction: column;
        cursor: pointer;
        position: absolute;
        overflow: auto;
        width: 15%;
        z-index: 99;
        
    }    
</style>