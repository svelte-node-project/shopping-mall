<script>
    import { page } from '$app/stores';
    import { goto } from '$app/navigation';
  
    let moreAboutUsLinks = [
      { name: 'Opening Hours', href: '/opening-hours' },
      { name: 'How to Find Us', href: '/how-to-find-us' },
      { name: 'Contact', href: '/contact' },
      { name: 'Feedback', href: '/feedback' },
      { name: 'Floor Map', href: '/floor-map' },
    ];

    let currentPath = '';
    $: currentPath = $page.url.pathname;
    $: currentPageName = moreAboutUsLinks.find(link => link.href === currentPath)?.name || 'More About Us';

  
    async function navigate(href, event) {
      event.preventDefault();
      console.log('Navigating to:', href);
      try {
        await goto(href);
      } catch (error) {
        console.error('Failed to navigate:', error);
      }
    }
  </script>
  
  <div class="page-name-header">
    <h2>{currentPageName}</h2>
  </div>

  <nav class="more-about-us-nav">
    {#each moreAboutUsLinks as {name, href}}
      <a
        href={href}
        class="nav-item text-xs {currentPath === href ? 'active' : ''}"
        on:click|preventDefault={(event) => navigate(href, event)}
      >
        {name}
      </a>
    {/each}
  </nav>
  
  <style>
    .page-name-header h2 {
      margin-top: 6rem;
      padding-left: 6rem;
      margin-bottom: 1rem;
      font-size: xx-large;
      font-weight: 900;
      font-family: 'Roboto', sans-serif;
      color: rgb(27, 26, 26);
    }
    .more-about-us-nav {
        margin-top: 1rem;
        padding-left: 5rem;
        gap: 0.5rem;
        display: flex;
        flex-wrap: wrap;
        gap: 0.5rem;
        z-index: 40;
    }
    .nav-item {
        position: relative;
        padding: 1rem 1rem;
        color: #4a5568;
        text-decoration: none;
    }
    .nav-item:hover  {
        color: rgb(38, 34, 34);
        border-bottom: 1px solid rgb(38, 34, 34);
    }
    .active {
      color: rgb(38, 34, 34);
      border-bottom: 1px solid rgb(192, 164, 129);
    }
    @media (max-width: 768px) {
      .nav-item {
        padding: 0.5rem 0.5rem;
      }
      .more-about-us-nav {
        padding-left: 1rem;
      }
      .page-name-header h2 {
        padding-left: 1rem;
      }
    }
  </style>