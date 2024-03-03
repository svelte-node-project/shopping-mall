Header.svelte:
<script>
  import { onMount } from "svelte";
  let isMenuOpen = false;

  function toggleMenu() {
    isMenuOpen = !isMenuOpen;
  }
</script>

<header class="bg-white fixed top-0 w-full z-50">
  <div class="container mx-auto px-7 lg:px-2 flex justify-between items-center py-2">
    <a href="/" class="logo flex items-center">
      <img src="logo.png" alt="Logo" class="h-8 mr-2" />
      <span>Iso Omena</span>
    </a>
    <div class="flex justify-between items-center">
      <nav class="hidden lg:flex lg:px-4 gap-10">
        <a href="/stores" class="hover:text-gray-800 tex-base font-bold">Stores</a>
        <a href="/restaurants" class="hover:text-gray-800 tex-base font-bold">Restaurants</a>
        <a href="/entertainment" class="hover:text-gray-800 tex-base font-bold">Entertainment</a>
        <a href="/info" class="hover:text-gray-800 tex-base font-bold">Info</a>
        <a href="/offers" class="hover:text-gray-800 tex-base font-bold">Offers</a>
        <a href="/about-us" class="hover:text-gray-800 tex-base font-bold">About us</a>
      </nav>
      <button class="menu-icon lg:ml-4" on:click={() => (isMenuOpen = !isMenuOpen)}>
        <i class="fa fa-bars"></i>
      </button>
    </div>
  </div>
</header>

{#if isMenuOpen}
  <div class="menu-content fixed inset-0 bg-[#1D2A4F] w-full h-screen text-white p-12" style="padding-left: 3rem;">
    <div class="flex justify-between items-center mb-4">
      <a href="/" class="logo flex items-center gap-2">
        <img src="logo.png" alt="Logo" class="h-8 lg:ml-10" />
        <span class="font-bold">Iso Omena</span>
      </a>
      <button class="mr-10 font-sm" on:click={() => (isMenuOpen = false)}>Close Menu &nbsp; ×</button>
    </div>
    <div class="relative items-center mb-8">
      <input type="text" placeholder="Search" class="search-input lg:ml-10" />
      <i class="search-icon fa fa-search"></i>
    </div>
    <div class="mt-7 flex flex-col lg:flex-row flex-wrap gap-4 lg:ml-10 lg:pt-4 mb-4">
      <a href="/stores" class="text-lg font-semibold">Stores</a>
      <a href="/restaurant" class="text-lg font-semibold">Restaurant</a>
      <a href="/entertainment" class="text-lg font-semibold">Entertainment</a>
      <a href="/info" class="text-lg font-semibold">Info</a>
      <a href="/offers" class="text-lg font-semibold">Offers</a>
      <a href="/about-us" class="text-lg font-semibold">About us</a>
    </div>
    <div class="mt-5">
      <span class="text-xs lg:ml-10 lg:pt-3 text-gray-400 mb-2">More about us:</span>
      <div class="flex flex-col lg:flex-row flex-wrap lg:ml-10 gap-3 mt-2">
        <a href="/opening-hours" class="text-xs">Opening hours</a>
        <a href="/how-to-find-us" class="text-xs">How to find us</a>
        <a href="parking" class="text-xs">Parking</a>
        <a href="/contact" class="text-xs">Contact</a>
        <a href="/recycling" class="text-xs">Recycling</a>
        <a href="/sustainability" class="text-xs">Sustainability</a>
        <a href="/newsletter" class="text-xs">Newsletter</a>
        <a href="/feedback" class="text-xs">Feedback</a>
        <a href="/floor-map" class="text-xs">Floor map</a>
      </div>
    </div>
  </div>
{/if}

<style>
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    background-color: #fff;
    position: sticky;
    padding: 1rem 7rem;
  }

  body {
    margin: 0;
    padding: 0 1rem;
  }

  .header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: calc(100% - 100px);
    margin: auto;
  }

  .logo {
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .main-nav {
    display: flex;
    gap: 1rem;
    
  }
  nav {
    align-items: center;
  }

  .menu-icon {
    cursor: pointer;
  }

  @media (max-width: 1024px) {
    .main-nav {
      display: none;
    }
    body {
      padding: 0 50px;
    }
    .header-container {
      padding: 1rem;
    }
    .search-container {
      margin-right: 1rem;
      width: auto; 
    }
    .header,
    .menu-content {
      padding-left: 7rem;
      padding-right: 7rem;
    }
    .page-content {
      margin-right: 9rem;
      margin-left: 5rem;
    }

    .menu-content {
      padding: 5rem;
      
    }
  }

  .menu-content {
    padding-left: 1rem;
    background-color: #1d2a4f;
    color: white;
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    overflow-y: auto;
    height: 100vh;
    z-index: 50;
  }

  .search-container {
    position: relative;
    display: flex;
    align-items: center;
    width: 80%;
    background-color: #1d2a4f;
    border-bottom: 2px solid #ccc;
    padding-right: 1rem; 
  }

  .search-input {
    width: 80%;
    padding: 0.5rem;
    background-color: #1d2a4f;
    border: none;
    outline: none;
    border: none;
    color: white;
    border-bottom: 2px solid #ccc;
    
  }

  .search-input:focus {
    border-bottom: 2px solid #ccc;
    outline: none;
    box-shadow: none;
  }

  .search-icon {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    color: white;
    cursor: none;
  }
</style>