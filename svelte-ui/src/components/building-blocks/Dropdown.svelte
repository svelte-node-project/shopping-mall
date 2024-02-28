<script>
    import { onMount } from "svelte";

    // let { type, fetchFrom, value } = $props();
    let { options, value, showOptions } = $props();
    // let options;
    // const fieldName = {
    //     "category": "name",
    //     "floor": "level"
    // };

    const updateValueAndClose = (item) => {
        return () => {
            // console.log("????????????????")
            value = item;
            // console.log(value);
            showOptions = !showOptions;
            // return value;
        };
    };

    // onMount(async () => {
    //     const result = await fetch(fetchFrom);
    //     options = [
    //         { name: "All", value: ""},
    //         ...(await result.json())
    //             .map(el => ({ name: el[fieldName[type]], value: el[fieldName[type]] }))
    //     ];
    //     console.log("!!!!!!!!!");
    //     console.log(options);
    // });

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
        width: inherit;
        max-width: 100%;
        z-index: 99;
    }    
</style>