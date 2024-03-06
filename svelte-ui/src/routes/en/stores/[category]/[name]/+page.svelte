<script>
    import Company from "../../../../../components/Company.svelte";

    const { data } = $props();
</script>

<Company data={data.name}/>