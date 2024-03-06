<script>
    import Companies from '../../../components/Companies.svelte';

    let searchParams = $state({
        "category": "",
        "floor": "",
        "text": ""
    });

    // const href = "http://localhost:3001/companies?types=tenant&group=true&full=true";
    const href = "http://localhost:3001/companies?group=true&full=true";
</script>


<Companies bind:searchParams={searchParams} href={href} header={"Stores"}/>