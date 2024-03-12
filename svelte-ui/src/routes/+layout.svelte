<script>
    import "../app.css";
    import 'flowbite';
    import Navbar from "../components/Navbar.svelte";
    import Footer from "../components/Footer.svelte";
    import MoreAboutUsNav from "../components/MoreAboutUsNav.svelte";
    import { page } from '$app/stores';

    $: showMoreAboutUsNav = [
      "/opening-hours", 
      "/how-to-find-us", 
      "/contact",  
      "/feedback", 
      "/floor-map"
    ]
    .includes($page.url.pathname);
  </script>
  
  <Navbar />
  
  {#if showMoreAboutUsNav}
  <MoreAboutUsNav />
  {/if}
  
  <main>
    <slot />
  </main>
  
  <Footer />
