<script>
    import { onMount } from "svelte";

    const href = "http://localhost:3001/companies?group=true&full=true";
    let stores = [];

    const init = async () => {
        const result = await fetch(href);
        stores = await result.json();
    };

    const getStoreWorkingHours = (store) => {
        const weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

        return store?.companies?.flatMap(company => {
            const companyName = company.name;
            const openingHours = company?.working_hours?.map(hour => {
                const weekday = weekdays[hour.week_day] || "Unknown";
                const companyName =  company.name
                const byAppointment = hour.by_appointment || false; 
                return { companyName,weekday, startTime: hour.start_time, endTime: hour.end_time, byAppointment };
            });

            const groupedOpeningHours = openingHours?.reduce((groups, { companyName, weekday, startTime, endTime, byAppointment }) => {
                const lastGroup = groups[groups.length - 1];
                if (lastGroup && lastGroup.endTime === endTime && lastGroup.byAppointment === byAppointment) {
                    lastGroup.endWeekday = weekday;
                } else {
                    groups.push({ companyName, startWeekday: weekday, endWeekday: weekday, startTime, endTime, byAppointment });
                }
                return groups;
            }, []);

            const formattedCompanyHours = groupedOpeningHours?.map(({ startWeekday, endWeekday, startTime, endTime, byAppointment }) => {
                if (byAppointment) {
                    return "By appointment";
                }
                 else if (startTime && endTime) {
                    const start = startTime.slice(0, 5);
                    const end = endTime.slice(0, 5);
                    if (startWeekday === endWeekday) {
                        return `${startWeekday.slice(0, 3)} ${start}-${end}`;
                    } else {
                        return `${startWeekday.slice(0, 3)}-${endWeekday.slice(0, 3)} ${start}-${end}`;
                    }
                   
                }
    
            });

            return { companyName, hours: formattedCompanyHours };
        });
    };

    let storeWorkingHours = [];

    $: {
        storeWorkingHours = stores?.flatMap(getStoreWorkingHours);
        storeWorkingHours = storeWorkingHours.filter(function( element ) {
        return element?.hours !== undefined;
});
    }

    onMount(init);
</script>

<div class="md:mx-auto p-5">
    <h1 class="text-4xl font-bold mb-4">Working Hours</h1>
    {#if storeWorkingHours?.length > 0}
        <ul class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {#each storeWorkingHours as { companyName, hours }}
                <li class="bg-gray-100 border p-4 rounded-lg">
                    <h2 class="text-lg font-semibold mb-2">{companyName}</h2>
                    <div class="text-gray-600"> 
                        {#each hours as hour}
                          {#if hour}
                              <p>{hour}</p>
                         {/if}
                        {/each}
                    </div>
                </li>
            {/each}
        </ul>
    {:else}
        <p class="text-gray-600">No stores found.</p>
    {/if}
</div>
