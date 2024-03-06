<script>
    import { onMount } from "svelte";
    import CompaniesList from "./building-blocks/CompaniesList.svelte";
    import StoresSearchPanel from "./building-blocks/StoresSearchPanel.svelte";

    let { searchParams, href, header }= $props();
    let stores = $state([]);
    let allStores = [];
    const link = "stores";

    const categoryFilter = $derived(searchParams.category);
    const floorFilter = $derived(searchParams.floor);
    const textFilter = $derived(searchParams.text);

    const init = async () => {
        const result = await fetch(href);
        allStores = await result.json();
        stores = [...allStores];
    };

    const getFilteredStoresList = (category, floor, txt) => {
        return allStores.map(el => (
                {
                    letter: el.letter,
                    companies: [...el.companies].filter(company => (
                        (category ? company.categories.some(cat => cat.name === category) : true)
                        && company.locations &&
                        (floor ? company.locations.some(location => location.level === floor) : true)
                        &&
                        company.name.toLowerCase().includes(txt.toLocaleLowerCase())
                    ))
                }
            )).filter(el => el.companies.length > 0);
    };

    $effect(() => {
        stores = getFilteredStoresList(categoryFilter, floorFilter, textFilter);
    });
 
    onMount(init);
</script>


<h1>{header}</h1>

<StoresSearchPanel bind:searchParams={searchParams} />

<CompaniesList stores={stores} link={link} />