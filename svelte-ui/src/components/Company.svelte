<script>
    import { onMount } from "svelte";
    // import { getFormattedWorkingHours } from "../helpers/workingHoursHelper.js";

    let company = $state({});

    const { data } = $props();

    const init = async () => {
        let result = await fetch(`http://localhost:3001/companies/${data}`);
        
        company = await result.json();
    };

//     const getWorkingHoursToday = (workingHours) => {
//         const result = getFormattedWorkingHours(workingHours, true)[0];
//         return result ? result.formatted : "Closed";
//     };
 
    onMount(init);
</script>

<div>
      
      <div class="bg-white shadow-md rounded-md p-6">
        <h2 class="text-2xl font-bold mb-4">{company.name}</h2>
        <p class="text-gray-600 mb-2">{company.description}</p>
        <div class="flex items-center mb-2">
            <p class="text-gray-600 mb-2">Phone:
          {#each company.phone_numbers as phoneNumber}
            <span class="text-gray-600">{phoneNumber}</span>
            {#if !(phoneNumber === company.phone_numbers[company.phone_numbers.length - 1])}, {/if}
          {/each}
        </p>
        </div>
        <p class="text-gray-600 mb-2">Email: {company.email}</p>
        <p class="text-gray-600 mb-2">Website: <a href="{company.website}" target="_blank" class="text-blue-500 hover:underline">{company.website}</a></p>
      </div>
      

</div>
