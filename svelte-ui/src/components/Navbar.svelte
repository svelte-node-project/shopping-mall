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
        <li><a href="/restaurants">Dine</a></li>
        <li><a href="/info">Info</a></li>
        <li><a href="/offers">Offers</a></li>
        <li><a href="/happenings">Happenings</a></li>
      </ul>
    </nav>
  </header>