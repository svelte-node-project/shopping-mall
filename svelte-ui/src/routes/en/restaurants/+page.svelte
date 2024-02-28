<script>
	import Companies from './../../../components/Companies.svelte';

    // const { data } = $props();
    let searchParams = $state({
        "floor": "",
        "text": ""
    });

    const href = "http://localhost:3001/companies?group=true&full=true&categories=cafes%20and%20restaurants";
</script>

<Companies bind:searchParams={searchParams} href={href}/>