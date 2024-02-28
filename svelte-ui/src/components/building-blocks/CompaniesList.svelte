<script>
	import CompanyShortInfo from './CompanyShortInfo.svelte';

    const { stores, link } = $props();
</script>

<div class="container">
    {#each stores as store}
        <div class="row">
            <h2>{store.letter}</h2>
        </div>
        <div class="row">
           <div class="list-container">            
                {#each store.companies as company}
                    <div class="col">
                        <CompanyShortInfo company={company} link={link} />
                    </div>
                {/each}
            </div>
        </div>
 
    {/each}
</div>



<style>
    .list-container {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
    }
    
    .col {
        width: 25%;
    }
</style>