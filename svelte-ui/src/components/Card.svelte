<script>
    let { title, description, link, image } = $props();
  </script>
  
  <div class="card w-96 bg-base-100 shadow-xl">
    <img src={image} alt="offer" />
    <div class="card-body">
      <h2 class="card-title">{title}</h2>
      <p>{description}</p>
      <div class="card-actions justify-end">
        <!--a href="{link}" class="btn" style="background-color: #A8E3E3; color: white;">View</a-->
      </div>
    </div>
  </div>