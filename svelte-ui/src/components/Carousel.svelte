<script>
    import { onMount } from 'svelte';
    let activeIndex = 0;
    const images = [
      '/images/image1.png',
      '/images/image2.png',
    ];
  
    function nextImage() {
      activeIndex = (activeIndex + 1) % images.length;
    }
  
    function previousImage() {
      activeIndex = (activeIndex - 1 + images.length) % images.length;
    }
  
    onMount(() => {
      const interval = setInterval(nextImage, 5000); 
      return () => clearInterval(interval); 
    });

    /*
    import { onMount } from 'svelte';
    import { getOffers } from '../http-actions/homepage-api.js';
  
    let offers = $state([]);
  
    onMount(async () => {
      offers = await getOffers();
    });*/
    
    const banners = [
      { id: 1, name: "HP and the Philosopher's Stone", pages: 200, isbn: "123" }
    ];


</script>
  <!--
  <ul>
    {#each offers as offer}
      <li>{offer.name}</li>
    {/each}
  </ul>
  -->

  
  
  <div class="relative" style="min-height: 600px;">
    {#each images as image, index}
        <div class={`absolute inset-0 transition-opacity duration-500 ${index === activeIndex ? 'opacity-100' : 'opacity-0'}`}>
          <a href="/shop">
            <img src={image} alt={`Image ${index}`} class="w-full h-full object-cover"/>
          </a>
        </div>
    {/each}
    <button class="absolute left-2 top-1/2 transform -translate-y-1/2 bg-white bg-opacity-50 rounded-full w-10 h-10 flex items-center justify-center" on:click={previousImage}>&lt;</button>
    <button class="absolute right-2 top-1/2 transform -translate-y-1/2 bg-white bg-opacity-50 rounded-full w-10 h-10 flex items-center justify-center" on:click={nextImage}>&gt;</button>
  </div>
  