<script>
    let customerService = {
    tel: "+358 40 22 2222",
    email: "aurora@citycon.com",
    hours: "Mon-Fri 10am - 8pm, Sat 10am - 7pm"
};
</script>

<h2 class="text-xl font-bold">Customer Service</h2>
<div>

<p>Tel: {customerService.tel}</p>
<p>Email: <a href="mailto:{customerService.email}">{customerService.email}</a></p>
<p>Open: {customerService.hours}</p>
</div>