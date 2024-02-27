<script>
    import { onMount } from 'svelte';
    import { getEvent } from '../http-actions/happenings-api.js';

    let { eventId } = $props();
    let event = $state({});
    let updatedEvent = $state({});

    onMount(async () => {
        event = await getEvent(eventId);
       
        //event = { id: 1, title: 'POP MART ROBO SHOP IS HERE!| 01.-14.04.2024, Center Court', news_text: 'Members enjoy 20% off all products.', image_link:'/images/happenings4.png', show_on_homepage: true };

        const parts = event.title.split('| ');
        const title = parts[0];
        updatedEvent = {...event, title }
    });
</script>

<div class="flex flex-col items-center px-64 py-20">
    <div>
        <h1 class="text-5xl font-bold text-center" style="color: #266D85;">{updatedEvent.title}</h1>
        <div class="py-6">
            {#if updatedEvent.news_text}
                {@html updatedEvent.news_text}
            {/if}
        </div>
    </div>
</div>