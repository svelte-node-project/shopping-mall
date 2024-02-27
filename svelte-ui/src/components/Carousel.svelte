<script>
  import { onMount } from 'svelte';
  import { getBanners } from '../http-actions/homepage-api.js';

  let activeIndex = $state(0);
  let banners = $state([]);

  function nextImage() {
    activeIndex = (activeIndex + 1) % banners.length;
  }

  function previousImage() {
    activeIndex = (activeIndex - 1 + banners.length) % banners.length;
  }

  onMount(async () => {
    const interval = setInterval(nextImage, 5000); 

    banners = await getBanners();

    /*banners = [
      { id: 1, image_link:'/images/image1.png', navigation_link:'/shop',  offer_id:null, news_id:null},
      { id: 2, image_link:'/images/image2.png', navigation_link:'/happenings/',  offer_id:null, news_id:1}
    ];*/

    return () => clearInterval(interval); 
  });
</script>

<div class="relative" style="min-height: 600px;">
  {#each banners as banner, index}
      <div class={`absolute inset-0 transition-opacity duration-500 ${index === activeIndex ? 'opacity-100' : 'opacity-0'} ${index === activeIndex ? '' : 'pointer-events-none'}`}>
        <a href={`${banner.navigation_link}${banner.offer_id ? banner.offer_id : (banner.news_id ? banner.news_id : '')}`}>
          <img src={banner.image_link} alt={`Image ${index}`} class="w-full h-full object-cover"/>
        </a>
      </div>
  {/each}
  <button class="absolute left-2 top-1/2 transform -translate-y-1/2 bg-white bg-opacity-50 rounded-full w-10 h-10 flex items-center justify-center" on:click={previousImage}>&lt;</button>
  <button class="absolute right-2 top-1/2 transform -translate-y-1/2 bg-white bg-opacity-50 rounded-full w-10 h-10 flex items-center justify-center" on:click={nextImage}>&gt;</button>
</div>
  