<script>
    let { defaultName, options, value=$bindable(), showOptions } = $props();

    const updateValueAndClose = (event) => {
        console.log("option", options)
        const selectedIndex = event.target.selectedIndex;
        console.log("selected", selectedIndex)
        value = options[selectedIndex-1]?.value;
        console.log("value", value)
        showOptions = !showOptions;
        console.log("showoption", showOptions)
    };
console.log(options)
console.log("value",value)

</script>

<div >
    <select class="select select-bordered w-full max-w-xs" onchange={updateValueAndClose}>
        <option disabled selected>{defaultName}:</option>
        {#each options as option}
            <option value={option.value}>{option.name}</option>
        {/each}
    </select>
</div>

