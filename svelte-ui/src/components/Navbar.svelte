<script>
  import { goto } from '$app/navigation';
  
  let filterText = $state('');

  const searchByKey = (event) => {
    if (event.key === 'Enter') {
      search()
    }
  }

  const search = () => {
    goto(`/search?searchText=${filterText}`); 
    closeSearch()
  }

  const openSearch = () => {
    filterText = '';
    document.getElementById("myOverlay").style.display = "block";
  }

  const closeSearch = () => {
    document.getElementById("myOverlay").style.display = "none";
  }
</script>

<header class="navbar bg-base-100 drop-shadow navbar-styling" >

  <div class="flex-1 text-xl" style="font-size: 40px; display: flex; align-items: center;">
    <a href="/" style="display: flex; align-items: center;">
      <img src="/images/favicon.png" alt="Aurora Logo" style="height: 30px; margin-right: 10px;">
      <b>Aurora</b>
    </a>
  </div>
  <nav class="flex-none">
    <ul class="menu menu-horizontal px-1" style="font-size: 20px; font-weight: bold"> 
      <li><a href="/">Home</a></li>
      <li><a href="/shop">Shop</a></li>
      <li><a href="/dine">Dine</a></li>
      <li><a href="/info">Info</a></li>
      <li><a href="/offers">Offers</a></li>
      <li><a href="/happenings">Happenings</a></li>
    </ul>
  </nav>
  <button on:click={openSearch}><img alt='search' src='/images/search.png' style='width: 20px; height: 20px;' /></button>
</header>

<!-- Search Overlay -->
<div id="myOverlay" class="overlay">
  <button class='close-btn' on:click={closeSearch}>X</button>
  <div class="overlay-content">
    <label class="input input-bordered flex items-center gap-2">
      <input type="text" class="grow input text-2xl" placeholder="Search..." bind:value={filterText} on:keydown={searchByKey}  />
      <button on:click={search}>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-8 h-8 opacity-70"><path fill-rule="evenodd" d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z" clip-rule="evenodd" /></svg>
      </button>
    </label>
  </div>
</div>