<script>
  let { title, description, link, image } = $props();
</script>

<style>
  .card {
    transition: transform 0.3s ease; 
  }

  .card:hover {
    transform: scale(1.05); 
  }
</style>
  
<div class="card w-96 bg-base-100 shadow-xl">
  <a href={link}>
    <img src={image} alt="offer" />
    <div class="card-body">
      <h2 class="card-title">{title}</h2>
      <p>{description}</p>
      <div class="card-actions justify-end">
        <!--a href="{link}" class="btn" style="background-color: #A8E3E3; color: white;">View</a-->
      </div>
    </div>
  </a>
</div>