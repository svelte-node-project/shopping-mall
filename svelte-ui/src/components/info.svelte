
<script>
        import Contact from "./Contact.svelte"


    let office = {
        address: "Aurora 3 A, FIN-02230 ESPOO"
    };

    let lostProperty = {
        tel: "+358 40 22 2222",
        email: "aurora@citycon.com",
        hours: "Mon-Fri 10am - 8pm, Sat 10am - 7pm"
    };

    let petsInfo = "Pets are welcome in the center's public areas. Stores have different policies regarding pets, so please make sure before bringing your pet into the store.";
</script>



<div class=" md:mx-auto flex flex-col space-y-4 p-5">

    <h1 class="text-4xl font-bold">Info</h1>
    <nav class="mt-4">
        <ul class="main">
            <li class="mb-3"><a href="/hours" class="link link-hover">Opening hours</a></li>
            <li class="mb-3"><a href="/feedback" class="link link-hover">Feedback</a></li>
            <li class="mb-3"><a href="/giftcard" class="link link-hover">Gift card</a></li>
        </ul>
    </nav>

    
        <Contact />
    
        <h2 class="text-xl font-bold">Office</h2>
        <p>{office.address}</p>
    
        <h2 class="text-xl font-bold">Lost Property</h2>
        <div>

            <p>Customer service:</p>
            <p>Tel. {lostProperty.tel}</p>
            <p>Email: <a href="mailto:{lostProperty.email}">{lostProperty.email}</a></p>
            <p>Open: {lostProperty.hours}</p>
        </div>
    
        <h2 class="text-xl font-bold">Pets</h2>
        <p>{petsInfo}</p>
   
    
</div>
  

  <style>
    .main {
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
    }
    
  </style>