<script>
    import Companies from '../../../components/Companies.svelte';

    // const { data } = $props();

    let searchParams = $state({
        "category": "",
        "floor": "",
        "text": ""
    });

    const href = "http://localhost:3001/companies?types=tenant&group=true&full=true";
</script>

<!-- <Companies link={data.link}/> -->
<Companies bind:searchParams={searchParams} href={href}/>