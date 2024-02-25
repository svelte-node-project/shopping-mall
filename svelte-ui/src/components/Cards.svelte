<script>
    import Swiper from 'swiper';
    import { Navigation, Pagination } from 'swiper/modules';
    import 'swiper/css';
    import 'swiper/css/navigation';
    import 'swiper/css/pagination'; 
    import { onMount } from 'svelte';
    import Card from "../components/Card.svelte";
    
    onMount(() => {
      const swiper = new Swiper('.swiper', {
        modules: [Navigation, Pagination],
        slidesPerView: 3,
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },

      });
    });

    /*
    import { onMount } from 'svelte';
    import { getOffers } from '../http-actions/homepage-api.js';
  
    let offers = $state([]);
  
    onMount(async () => {
      offers = await getOffers();
    });*/
    
  </script>

  <style>
    .swiper-button-prev, .swiper-button-next {
      color: black;
    }

    .swiper-button-next:after, .swiper-button-prev:after {
      font-size: 20px;
    }
  </style>

  <!--
  <ul>
    {#each offers as offer}
      <li>{offer.name}</li>
    {/each}
  </ul>
  -->
  
  <div class="swiper bg-gray-300" style="padding-bottom: 10px;">
    <p class="header">
      Offers&nbsp
      <a class="view-all-link" href="/offers">View all</a>
    </p>
    <div class="swiper-wrapper mt-10 mb-10 ml-11">
      <div class="swiper-slide"><Card title="LUMENE - VALID 01.-07.04.2024" description="20% off all products for member only" link="/offers/1" image="/images/offer1.png" /></div>
      <div class="swiper-slide"><Card title="STARBUCKS - VALID 11.04.2024" description="Buy 1 free 1" link="/" image="/images/offer2.png" /></div>
      <div class="swiper-slide"><Card title="TECTOR" description="Start from €1399 Normal price from €1499" link="/" image="/images/offer3.png" /></div>
      <div class="swiper-slide"><Card title="BODY SHOP - VALID 01.-07.04.2024" description="20% off all products for member only" link="/" image="/images/offer4.png" /></div>
      <div class="swiper-slide"><Card title="SHOP 5" description="Offer 5" link="/" image="/images/offer5.png" /></div>
    </div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
  
  <p class="header">
    Happenings&nbsp
    <a class="view-all-link" href="/happenings">View all</a>
  </p>
  <div class="flex justify-evenly mt-10 mb-10">
    <Card title="MOOMIN POP UP STORE" description="06.-07.04.2024, Center Court" link="/happenings/1" image="/images/happenings1.png" />
    <Card title="COWORK" description="CoWork workspace is now open to everyone" link="/" image="/images/happenings2.png" />
    <Card title="BIG DOUGHNUTS" description="Grand opening 01.04.2024" link="/" image="/images/happenings3.png" />
  </div>
  