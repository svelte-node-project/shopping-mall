<script>
    let { defaultName, options, value=$bindable(), showOptions } = $props();

    const updateValueAndClose = (event) => {
        const selectedIndex = event.target.selectedIndex;
        value = options[selectedIndex-1]?.value;
        showOptions = !showOptions;
    };

</script>

<div >
    <select class="select select-bordered w-full max-w-xs" onchange={updateValueAndClose}>
        <option disabled selected>{defaultName}:</option>
        {#each options as option}
            <option value={option.value}>{option.name}</option>
        {/each}
    </select>
</div>

