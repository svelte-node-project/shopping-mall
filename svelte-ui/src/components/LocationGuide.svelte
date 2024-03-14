

<div class="description">
    <p>Shopping centre Aurora is located in the center of Helsinki.</p>
</div>

<div id="map" class="map-container"></div>

<div class="info-section" style="padding-top: 3rem;">
  <div class="info-column">
      <h3>Contact information</h3>
      <p><strong>Aurora Shopping Center</strong><br>
         Apollonkatu 11, FIN-00330 HELSINKI<br>
         Tel. +358 00 000 0000<br>
         <a href="/contact">More on contact information</a>
      </p>
      <h3>Arriving by bicycle</h3>
      <p>Next to Aurora's main entrance, you can find bicycle parking facilities where you can leave your bike for the duration of your visit. </p>
  </div>

  <div class="info-column">
      <h3>Public transport</h3>
      <p>Shopping centre Aurora is located in Apollonkatu, Helsinki, with excellent public transport connections.</p>
      <h4>By metro or bus</h4>
      <p>Aurora is quick and easy to reach by metro and bus. You can access the shopping centre directly from public transport terminals without the need to go outdoors. 
        You can check travel routes and timetables from the <a href="https://www.hsl.fi/en" target="_blank" rel="noopener noreferrer">HSL's website</a>.</p>
  </div>

  <div class="info-column">
      <h3>Parking</h3>
      <p>There is enough space for everyone in Aurora's large parking garage. We use Ranta Park's barrier-free parking, so you can drive in and out without stopping.</p>
      <p>The car parks and P-talo can be reached via ramps from Töölö. All Aurora customers can park for free for two hours 
        and our mobile app users get an additional two hours of free parking. We offer a total of 30 charging points for electric cars.</p>
  </div>

  <div class="info-column">
      <h3>Taxi rank</h3>
      <p>A taxi rank is located on Apollonkatu, on the western side of Aurora. Wheelchair-accessible taxis can also drop off and pick up customers by the taxi rank.</p>
  </div>
</div>

<style>
 .description {
    padding-left: 5.5rem;
    padding-right: 1rem;
    padding-top: 4rem;
  }

 .description p {
    font-weight: 300;
    font-size: 12px;
  }

  .map-container {
    padding: 1rem;
  }

  #map {
   margin: 1rem;
   width: 90vw;
   height: 300px;
  }

  .info-section {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 2rem;
    padding: 5.5rem;
  }

  .info-column h3, .info-column h4 {
    margin: 0;
    padding-bottom: 0.5rem;
    font-size: 1rem;
    font-weight: bold;
    color: #4d4a4a;
  }

  .info-column p {
    margin: 0;
    padding-bottom: 1.5rem;
    font-size: 0.875rem;
    line-height: 1.25;
    color: #717171;
  }

  .info-column a {
    position: relative;
    z-index: 10; 
    text-decoration: underline;
  }

  @media (max-width: 768px) {
    .info-section {
      grid-template-columns: 1fr;
      padding: 3rem 1.5rem;
    }

    .description {
      padding: 3rem 1.5rem 1rem 1.5rem;
    }
  }

  @media (min-width: 768px) {
    .map-container {
      padding-right: 1rem;
      padding-left: 2rem;
      padding-top: 1rem;
      padding-bottom: 2rem;
    }

    #map {
      margin-left: auto;
      margin-right: auto;
      width: calc(95% - 6rem);
    }
  }
</style>