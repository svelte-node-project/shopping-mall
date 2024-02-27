<script>
    import Event from '../../../components/Event.svelte';
    import { page } from '$app/stores';

    let eventId = $page.params.happeningId;
</script>

<svelte:head>
    <title>Happenings . Aurora</title>
</svelte:head>

<Event eventId={eventId} />
