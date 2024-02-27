<script>
    import Companies from '../../../components/Companies.svelte';

    const { data } = $props();
</script>

<Companies link={data.link}/>