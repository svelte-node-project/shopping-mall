<script>
    import { getFormattedWorkingHours } from "../../helpers/workingHoursHelper";

    const { company, link } = $props();

    const workingHoursToday = (() => {
        const result = getFormattedWorkingHours(company.working_hours, true)[0];
        return result ? result.formatted : "Closed";
    })();

</script>


<div class:closed={workingHoursToday.toLowerCase().includes("closed") ? true : false}>
    <h3><a href="{link}/{company.categories[0].name_in_url}/{company.name_in_url}">{company.name}</a></h3>
    <p>
        {company.categories[0].name}
        {#if company.locations}
            {String.fromCharCode(0x00B7)} {company.locations[0].level}
        {/if}
    </p>
    <p>Today: <strong>{workingHoursToday}</strong></p>
</div>


<style>
    .closed {
        opacity: 0.4;
    }
</style>