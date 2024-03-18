<script>
    import { onMount } from 'svelte';
    import { getOffer } from '../http-actions/offers-api.js';

    let { offerId } = $props();
    let offer = $state({});
    let updatedOffer = $state({});
    let storeLink = $state('');

    onMount(async () => {
        offer = await getOffer(offerId);
        storeLink = await getCompanyLink(offerId);

        //offer = { id: 1, company_id: 1, name: 'LUMENE - 20% OFF ALL PRODUCTS, Valid 01.-07.04.2024', description: 'Members enjoy 20% off all products. Valid 01.-07.04.2024.', image_link:'/images/offer1.png', show_on_homepage: true };

        const parts = offer.name.split('| ');
        const title = parts[0];
        updatedOffer = {...offer, title }
    });
</script>

<div class="flex flex-wrap md:flex-nowrap">
<div class="flex-1 p-10">
    <div class="blueFont pb-8"><a href="/">HOME</a> / <a href="/offers">OFFERS</a> / {updatedOffer.title}</div>
    <h2 class="text-6xl font-bold mb-8 blueFont">{updatedOffer.title}</h2>
    <p class="text-xl mb-8">{updatedOffer.description}</p>
    <a href={storeLink} class="view-all-link">Visit Store</a>
</div>
<div class="flex-1 p-10">
    <img src={updatedOffer.image_link} alt="Description of the offer" class="max-w-full h-auto rounded-lg shadow-md" />
</div>
</div>
