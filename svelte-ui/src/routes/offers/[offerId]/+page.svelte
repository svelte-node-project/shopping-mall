<script>
  import Offer from '../../../components/Offer.svelte';
  import { page } from '$app/stores';

  let offerId = $page.params.offerId;
</script>

<svelte:head>
  <title>Offers . Aurora</title>
</svelte:head>

<Offer offerId={offerId}/>