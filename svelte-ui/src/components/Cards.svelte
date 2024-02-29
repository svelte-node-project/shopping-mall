<script>
  import Swiper from 'swiper';
  import { Navigation, Pagination } from 'swiper/modules';
  import 'swiper/css';
  import 'swiper/css/navigation';
  import 'swiper/css/pagination'; 
  import { onMount } from 'svelte';
  import Card from "../components/Card.svelte";
  import { getOffers } from '../http-actions/offers-api.js';
  import { getHappenings } from '../http-actions/happenings-api.js';

  let offers = $state([]);
  let happenings = $state([]);
  let offers_on_homepage = $state([]);
  let happenings_on_homepage = $state([]);

  onMount(async () => {
    var swiper1 = new Swiper('.swiper1', {
      modules: [Navigation, Pagination],
      slidesPerView: 3,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });

    var swiper2 = new Swiper('.swiper2', {
      modules: [Navigation, Pagination],
      slidesPerView: 3,
      pagination: {
        el: '.swiper-pagination',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });

    offers = await getOffers();

    /*offers = [
      { id: 1, company_id: 1, name: 'LUMENE - VALID 01.-07.04.2024| 20% off all products', description: 'Members enjoy 20% off all products.', image_link:'/images/offer1.png', show_on_homepage: true },
      { id: 2, company_id: 2, name: 'STARBUCKS - VALID 11.04.2024| Buy 1 free 1', description: 'Enjoy buy 1 free 1 on any handcrafted beverage purchased on Member\'s Day.', image_link:'/images/offer2.png', show_on_homepage: true },
      { id: 3, company_id: 3, name: 'TECTOR| Start from €1399 Normal price from €1499', description: 'Apple Iphone 15 Pro Max starts from €1399, normal price from €1499.', image_link:'/images/offer3.png', show_on_homepage: true },
      { id: 4, company_id: 4, name: 'BODY SHOP - VALID 01.-14.04.2024| Get Sweet Dreams Discovery Kit at €30', description: 'Give the gift of relaxation with our Sweet Dreams Discovery Kit at €30. A calming balm and essential oil to accompany your bedtime routine.', image_link:'/images/offer4.png', show_on_homepage: true },
      { id: 5, company_id: 5, name: 'HALONEN - VALID 01.-14.04.2024| End of season sale', description: 'End of season sale - up to 50% off. The sale is only valid on selected products while stocks last.', image_link:'/images/offer5.png', show_on_homepage: true }
    ]*/

    offers_on_homepage = (offers.filter(offer => offer.show_on_homepage)).map(offer => {
      const parts = offer.name.split('| ')
      const title = parts[0]
      const details = parts[1]

      return {...offer, title, details }
    });

    happenings = await getHappenings();

    /*happenings = [
      { id: 1, title: 'MOOMIN POP UP STORE| 06.-07.04.2024, Center Court', news_text: 'Members enjoy 20% off all products.', image_link:'/images/happenings1.png', show_on_homepage: true },
      { id: 2, title: 'COWORK| CoWork workspace is now open to everyone', news_text: 'Enjoy buy 1 free 1 on any handcrafted beverage purchased on Member\'s Day.', image_link:'/images/happenings2.png', show_on_homepage: true },
      { id: 3, title: 'BIG DOUGHNUTS| Grand opening 01.04.2024', news_text: 'Apple Iphone 15 Pro Max starts from €1399, normal price from €1499.', image_link:'/images/happenings3.png', show_on_homepage: true },
      { id: 1, title: 'POP MART ROBO SHOP IS HERE!| 01.-14.04.2024, Center Court', news_text: 'Members enjoy 20% off all products.', image_link:'/images/happenings4.png', show_on_homepage: true },
    ]*/

    happenings_on_homepage = (happenings.filter(h => h.show_on_homepage)).map(h => {
      const parts = h.title.split('| ')
      const name = parts[0]
      const details = parts[1]

      return {...h, name, details }
    });
  });
</script>   

<style>
  .swiper-button-prev, .swiper-button-next {
    color: black;
  }

  .swiper-button-next:after, .swiper-button-prev:after {
    font-size: 20px;
  }
</style>

<div class="swiper1 swiper bg-gray-300" style="padding-bottom: 10px;">
  <p class="header">
    Offers&nbsp
    <a class="view-all-link" href="/offers">View all</a>
  </p>
  <div class="swiper-wrapper mt-10 mb-10 ml-11">
    {#each offers_on_homepage as offer}
      <div class="swiper-slide">
        <Card title={offer.title} description={offer.details} link={`/offers/${offer.id}`} image={offer.image_link} />
      </div>
    {/each}
  </div>
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
</div>

<div class="swiper2 swiper" style="padding-bottom: 10px;">
  <p class="header">
    Happenings&nbsp
    <a class="view-all-link" href="/happenings">View all</a>
  </p>
  <div class="swiper-wrapper mt-10 mb-10 ml-11">
    {#each happenings_on_homepage as event}
      <div class="swiper-slide">
        <Card title={event.name} description={event.details} link={`/happenings/${event.id}`} image={event.image_link} />
      </div>
    {/each}
  </div>
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
</div>

