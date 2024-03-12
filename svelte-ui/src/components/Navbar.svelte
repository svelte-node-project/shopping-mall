<script>
  import { page } from '$app/stores';
  let isMenuOpen = false;
  
  function toggleMenu() {
    isMenuOpen = !isMenuOpen;
  }
  $: path = $page.url.pathname;

  function navigate() {
    isMenuOpen = false;
  }
</script>

<header class="header bg-white fixed top-0 w-full z-50">
  <div class="header-container container mx-auto px-4 flex justify-between items-center py-2">
    <a href="/" class="logo flex items-center">
      <img src="favicon.png" alt="Logo" class="h-8 mr-2" />
      <span class="font-bold">Aurora</span>
    </a>
    <div class="right-container flex items-center gap-4">
      <nav class="nav-items hidden lg:flex gap-10">
        <a href="/" class="nav-item hover:text-gray-800 text-base font-semibold">Home</a>
        <a href="/shop" class="nav-item hover:text-gray-800 text-base font-semibold">Shop</a>
        <a href="/dine" class="nav-item hover:text-gray-800 text-base font-semibold">Dine</a>
        <a href="/info" class="nav-item hover:text-gray-800 text-base font-semibold">Info</a>
        <a href="/offers" class="nav-item hover:text-gray-800 text-base font-semibold">Offers</a>
        <a href="/happenings" class="nav-item hover:text-gray-800 text-base font-semibold">Happenings</a>
      </nav>
      <button class="menu-icon lg:ml-4" on:click={toggleMenu}>
        <i class="fa fa-bars" aria-label="Toggle menu"></i>
      </button>
    </div>
  </div>
</header>

{#if isMenuOpen}
  <div class="menu-content bg-[#1D2A4F] fixed inset-0 text-white p-8 ">
    <div class="close-container flex justify-between items-center mb-4">
      <a href="/" class="logo flex items-center gap-2" on:click={navigate}>
        <img src="favicon.png" alt="Logo" class="h-8" />
        <span class="font-bold">Aurora</span>
      </a>
      <button class="close-btn pt-1" on:click={toggleMenu} style="font-size: 2rem;">×</button>
    </div>
    <div class="search-container relative items-center mb-8">
      <input type="text" placeholder="Search" class="search-input text-xs" />
      <i class="search-icon fa fa-search" aria-hidden="true"></i>
    </div>
    <div class="links-container mt-7 pt-7 flex flex-col lg:flex-row gap-5">
      <a href="/" class="main-link text-lg font-semibold {path === '/' ? 'active' : ''}" on:click={navigate}>Home</a>
      <a href="/shop" class="main-link text-lg font-semibold {path === '/shop' ? 'active' : ''}" on:click={navigate}>Shop</a>
      <a href="/dine" class="main-link text-lg font-semibold {path === '/dine' ? 'active' : ''}" on:click={navigate}>Dine</a>
      <a href="/info" class="main-link text-lg font-semibold {path === '/info' ? 'active' : ''}" on:click={navigate}>Info</a>
      <a href="/offers" class="main-link text-lg font-semibold {path === '/offers' ? 'active' : ''}" on:click={navigate}>Offers</a>
      <a href="/happenings" class="main-link text-lg font-semibold {path === '/happenings' ? 'active' : ''}" on:click={navigate}>Happenings</a>
    </div>
    <div class="more-info mt-9">
      <span class="text-xs text-gray-400 mb-2">More about us:</span>
      <div class="sub-links flex flex-col lg:flex-row gap-5 mt-2">
        <a href="/opening-hours" class="sub-link text-xs {path === '/opening-hours' ? 'active' : ''}" on:click={navigate}>Opening hours</a>
        <a href="/how-to-find-us" class="sub-link text-xs {path === '/how-to-find-us' ? 'active' : ''}" on:click={navigate}>How to find us</a>
        <a href="/contact" class="sub-link text-xs {path === '/contact' ? 'active' : ''}" on:click={navigate}>Contact</a>
        <a href="/feedback" class="sub-link text-xs {path === '/feedback' ? 'active' : ''}" on:click={navigate}>Feedback</a>
        <a href="/floor-map" class="sub-link text-xs {path === '/floor-map' ? 'active' : ''}" on:click={navigate}>Floor map</a>
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
    position: fixed;
    z-index: 100;
  }

  .header-container, .menu-content {
    padding: 1rem 1rem;
  }
  

  .logo, .main-link, .link, .sub-link {
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .menu-icon, .close-btn {
    cursor: pointer;
    background: none;
    border: none;
    font-size: 1.25rem;
  }

  .menu-content {
    background-color: #1d2a4f;
    color: white;
    overflow-y: auto;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 100;
    padding: 1rem;
  }

  .search-input {
    width: 80%;
    padding: 0.5rem;
    background-color: #1d2a4f;
    border: 2px solid #ccc;
    color: white;
    outline: none;
    border: none;
    border-bottom: 2px solid #ccc;
  }
  .search-input:focus {
    border-bottom: 2px solid #ccc;
    outline: none;
    box-shadow: none;
  }

  .search-icon {
    position: absolute;
    right: 20%;
    top: 50%;
    transform: translateY(-50%);
    color: white;
  }

  @media (max-width: 1024px) {
    .header-container, .menu-content {
      padding: 1rem 1rem;
    }
  }
  @media (min-width: 1024px) {
    .menu-content {
      padding: 1.5rem 7rem;
    }
    
    .search-icon {
      right: 20%;
    }
  }

</style>