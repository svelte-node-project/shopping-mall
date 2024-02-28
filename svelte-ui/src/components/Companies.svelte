<script>
    import { onMount } from "svelte";
    import Dropdown from "./building-blocks/Dropdown.svelte";
    // import CompanyShortInfo from "./building-blocks/CompanyShortInfo.svelte";
    import CompaniesList from "./building-blocks/CompaniesList.svelte";
    import StoresSearchPanel from "./building-blocks/StoresSearchPanel.svelte";

    const { link }= $props();
    let stores = $state([]);
    // let categories = [];
    // let floors = [];
    // let searchValue = $state("");
    // let category = $state("");
    // let floor = $state("");
    let allStores = [];
    // let showCategories = $state(false);
    // let showFloors = $state(false);

    let searchParams = $state({
        "category": "",
        "floor": "",
        "text": ""
    });
    // const searchParams = $state({
    //     "category": "",
    //     "floor": "",
    //     "text": ""
    // });

    const init = async () => {
        // const time1 = Date.now();

        // const result = await fetch("http://localhost:3001/companies?types=tenant&group=true&full=true");
        let result = await fetch("http://localhost:3001/companies?group=true&full=true");
        
        // const time2 = Date.now();
        // console.log(`Fetch to companies: ${time2 - time1}`);


        allStores = await result.json();
        // console.log(allStores)
        stores = [...allStores];

        // const time3 = Date.now();
        // console.log(`Stores array: ${time3 - time2}`);
        

        // result = await fetch("http://localhost:3001/categories");

        // const time4 = Date.now();
        // console.log(`Fetch to categories: ${time4 - time3}`);

        // categories = [{ name: "All", value: ""}, ...(await result.json()).map(el => ({ name: el.name, value: el.name }))];

        // const time5 = Date.now();
        // console.log(`Categories array: ${time5 - time4}`);

    };

    // const filterByCategory = () => {
    //     showCategories = !showCategories;
    // };
 
    // const filterByFloor = () => {

    // };

    // const closeDropdowns = () => {     
    //     showCategories = false;
    // }

    const getFilteredStoresList = (category, txt) => {
        // console.log("!!!!!!!!!!!!!!!!1")
        return allStores.map(el => (
                {
                    letter: el.letter,
                    companies: [...el.companies].filter(company => (
                        (category ? company.categories.some(cat => cat.name === category) : true)
                        &&
                        company.name.toLowerCase().includes(txt.toLocaleLowerCase())
                    ))
                }
            )).filter(el => el.companies.length > 0);
    };

    const categoryFilter = $derived(searchParams.category);
    const textFilter = $derived(searchParams.text);
    // const textFilter = $derived(searchValue);

    $effect(() => {
        stores = getFilteredStoresList(categoryFilter, textFilter);
    });
    // const categoryFilter = $derived(category);
    // const textFilter = $derived(searchValue);

    // $effect(() => {
    //     stores = getFilteredStoresList(categoryFilter, textFilter);
    // });
 
    onMount(init);
</script>

<h1>Stores</h1>

<StoresSearchPanel bind:searchParams={searchParams} />

<!-- {categoryFilter} -->

<!-- <div class = "filter">
    <button type="button" on:click|stopPropagation={filterByCategory}>{category === "" ? "By category" : category}</button>
    {#if showCategories}
        <Dropdown list={categories} bind:searchBy={category} />
        
    {/if}
</div> -->
<!-- <div class = "filter">
    <button type="button" on:click|stopPropagation={filterByFloor}>{floor === "" ? "By floor" : floor}</button>
    {#if showFloors}
        <Dropdown list={floors} bind:searchBy={floor} />
        {filterStores()}
    {/if}
    
</div> -->


<!-- <input type="search" on:click={filterByCategory} placeholder="Search" bind:value={searchValue} /> -->

<CompaniesList stores={stores} link={link} />