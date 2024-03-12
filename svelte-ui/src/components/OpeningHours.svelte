<script>
  const hoursInfo = [
    { section: 'Center doors open', hours: [{ days: 'Mon-Sun', time: '6.30—23' }] },
    { section: 'Stores and services open at least', hours: [
        { days: 'Mon—Fri', time: '10—21' },
        { days: 'Sat', time: '10—19' },
        { days: 'Sun', time: '12—18' }
      ]
    },
    { section: '2nd floor stores', hours: [
        { days: 'Mon-Fri', time: '10—20' },
        { days: 'Sat', time: '10—19' },
        { days: 'Sun', time: '12—18' }
      ]
    },
    { section: 'M.E.E.T restaurants open', hours: [
        { days: 'Mon-Thu', time: '11—21' },
        { days: 'Fri-Sat', time: '11—22' },
        { days: 'Sun', time: '12—20' }
      ]
    },
    { section: 'Access to the subway and bus terminal', hours: [
        { days: 'Mon-Sat', time: '4.30—03.00' },
        { days: 'Sun', time: '5.30—03.00' },
        { days: 'On public holidays', time: '5.30—03.00' }
      ]
    },
    { section: 'Grocery stores open', hours: [
        { days: 'Mon-Fri', time: '05.30—00.00' },
        { days: 'Sat', time: '6—00.00' },
        { days: 'Sun', time: '6—00.00' }
      ]
    },
  ];
</script>

<div class="opening-hours-container">
  {#each hoursInfo as info}
    <div class="opening-section">
      <h2 class="section-header">{info.section}</h2>
      {#each info.hours as hour}
        <div class="hour-info">
          <span class="days">{hour.days}</span>
          <span class="line"></span>
          <span class="time">{hour.time}</span>
        </div>
      {/each}
    </div>
  {/each}
</div>

<style>
  .opening-hours-container {
      padding-top: 4rem;
      padding-left: 5rem;
      padding-right: 5rem;
      font-family: 'Roboto', sans-serif;
      display: flex;
      flex-direction: column;
  }

  .opening-section + .opening-section {
      margin-top: 2rem;
  }

  .section-header {
      font-weight: 800;
      font-size: large;
      padding: 0.5rem 1rem;
      margin-bottom: 1rem;
  }

  .hour-info {
      display: flex;
      align-items: center;
      margin-bottom: 1rem;
  }

  .days {
      flex-basis: 20%;
      margin-right: 2rem;
      text-align: left;
      padding-left: 1rem;
      font-size: 1rem;
  }

  .line {
      display: inline-block;
      width: 6rem;
      flex-basis: 30%;
      border-bottom: 1px solid black;
  }

  .time {
      flex-basis: 20%;
      white-space: nowrap;
      text-align: left;
      font-size: 1rem;
  }

  @media (max-width: 768px) {
    .opening-hours-container {
       padding-left: 0.5rem;
       padding-right: 0.5rem;
    }

    .section-header, .hour-info {
       padding-left: 0;
       padding-right: 0;
    }

    .days {
      margin-right: 1rem;
    }

    .time {
      flex-basis: auto;
      margin-left: auto;
      padding-right: 0.5rem;
    }  
  }
  @media (min-width: 1024px) {
    .opening-hours-container {
        padding-right: 10rem;
    }
    .line {
        margin-right: 7rem;
    }
  }
</style>