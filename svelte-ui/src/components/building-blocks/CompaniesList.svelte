<script>
	import CompanyShortInfo from './CompanyShortInfo.svelte';

    const { stores, link } = $props();
</script>

{#each stores as store}
    <h2>{store.letter}</h2>
    {#each store.companies as company}
        <CompanyShortInfo company={company} link={link} />
    {/each}
{/each}