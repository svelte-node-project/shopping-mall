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

<h1>{company.name}</h1>

<div>

    {JSON.stringify(company)}

</div>
