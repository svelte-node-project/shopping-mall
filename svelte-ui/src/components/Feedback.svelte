<script>
import { writable } from 'svelte/store';
import { submitFeedback } from '../http-actions/feedback-api.js';

  let feedbackType = "general";
  let selectedShop = "";
  let feedbackText = "";
  let name = "";
  let email = "";
  let reply = false;
  let feedbackCategories = [];

  let feedbackSubmitted = writable(false);
  let submissionError = writable(false);
  let submitting = writable(false);
  

  let shops = [
  { value: "shop_aangan", name: "Aangan" },
  { value: "shop_alko", name: "Alko" },
  { value: "shop_atlaspro", name: "AtlasPro" },
  { value: "shop_bangkok9", name: "Bangkok9 Iso Omena" },
  { value: "shop_barbar", name: "Bär Bar" },
  { value: "shop_caffi", name: "Caffi" },
  { value: "shop_chapple", name: "Chapple" },
  { value: "shop_citycon", name: "Citycon" },
  { value: "shop_clasohlson", name: "Clas Ohlson" },
  { value: "shop_cropp", name: "Cropp" },
  { value: "shop_cubus", name: "Cubus" },
  { value: "shop_cutters", name: "Cutters" },
  { value: "shop_decanter", name: "Decanter" },
  { value: "shop_elixia", name: "Elixia" },
  { value: "shop_fuku", name: "Fuku" },
  { value: "shop_glitter", name: "Glitter" },
  { value: "shop_hemtex", name: "Hemtex" },
  { value: "shop_joutsen", name: "Jou tsen" },
  ];

  let validationMessages = {
    selectedShop: "",
    feedbackText: "",
    name: "",
    email: "",
  };

  function handleCheckboxChange(event) {
    const { name, checked } = event.target;
    if (checked && !feedbackCategories.includes(name)) {
      feedbackCategories = [...feedbackCategories, name];
    } else {
      feedbackCategories = feedbackCategories.filter(category => category !== name);
    }
  }

  function clearValidationMessage(field) {
    if (validationMessages[field]) {
      validationMessages[field] = "";
    }
  }

  function validateField(field, value) {
    validationMessages[field] = value.trim() ? "" : "Field is required";
    return !!value.trim();
  }

  function validateForm() {
    let isValid = true;
    if (feedbackType === "specific") {
      isValid = validateField('selectedShop', selectedShop) && isValid;
    }
    isValid = validateField('feedbackText', feedbackText) && isValid;
    isValid = validateField('name', name) && isValid;
    isValid = validateField('email', email) && isValid;

    console.log("Form is valid?", isValid);
    return isValid;
  }

  async function handleSubmit() {
    submitting.set(true);
    const formattedFeedbackCategories = feedbackCategories.map(category => category.charAt(0).toUpperCase() + category.slice(1));
    const feedbackData = {
      feedbackType,
      selectedShop,
      feedbackText,
      name,
      email,
      reply,
      feedbackCategories: formattedFeedbackCategories
    };
    
    if (validateForm()) {
      try {
        await submitFeedback(feedbackData);
        feedbackSubmitted.set(true);
      } catch (error) {
        console.error('Submission error:', error);
        submissionError.set(true);
      }
    }
    submitting.set(false);
  }

</script>

<div class="feedback-container">
  <p>
    Please note that this form is for giving feedback to the shopping center or
    the centre's shops. Do not share your health, banking, <br class="responsive-break" />or personal
    information in this form.
  </p>
  <br />
  <p>Required fields</p>
  <br />
  <form class="feedback-form" on:submit|preventDefault={handleSubmit}>
    <div>
      <p>Target</p>
      <label for="feedback-general">
        <input
          type="radio"
          id="feedback-general"
          name="feedbackType"
          value="general"
          bind:group={feedbackType}
        />
        General feedback
      </label>

      <label for="feedback-specific">
        <input
          type="radio"
          id="feedback-specific"
          name="feedbackType"
          value="specific"
          bind:group={feedbackType}
        />
        Feedback to a specific company
      </label>
    </div>

    {#if feedbackType === "specific"}
      <label for="shop-select">
        <select id="shop-select" bind:value={selectedShop} on:change={() => clearValidationMessage('selectedShop')}>
          <option value="">choose a shop</option>
          {#each shops as shop}
            <option value={shop.value}>{shop.name}</option>
          {/each}
        </select>
      </label>
      {#if validationMessages.selectedShop}
        <p class="validation-message ml-4" >{validationMessages.selectedShop}</p>
      {/if}
    {/if}

    <p>Type of feedback</p>
    <label>
      <input
        type="checkbox"
        name="thanks"
        checked={feedbackCategories.thanks}
        on:change={handleCheckboxChange}
      />
      Thanks
    </label>
    <label>
      <input
        type="checkbox"
        name="suggestion"
        checked={feedbackCategories.suggestion}
        on:change={handleCheckboxChange}
      />
      Suggestion
    </label>
    <label>
      <input
        type="checkbox"
        name="complaint"
        checked={feedbackCategories.complaint}
        on:change={handleCheckboxChange}
      />
      Complaint
    </label>
    <label>
      <input
        type="checkbox"
        name="other"
        checked={feedbackCategories.other}
        on:change={handleCheckboxChange}
      />
      Other
    </label>

    <label for="feedback-text" class="mt-3 mb-1 text-m">Feedback</label>
    <textarea id="feedback-text" bind:value={feedbackText} 
    on:input={() => clearValidationMessage('feedbackText')} rows="4" ></textarea>
    {#if validationMessages.feedbackText}
      <p class="validation-message">{validationMessages.feedbackText}</p>
    {/if}

    <div class="name-email-container">
      <div class="name-input">
        <label for="name" class="text-m">Name</label>
        <input type="text" id="name" bind:value={name} 
        on:input={() => clearValidationMessage('name')} class="input-field" />
        {#if validationMessages.name}
          <p class="validation-message">{validationMessages.name}</p>
        {/if}
      </div>
      
      <div class="email-input">
        <label for="email" class="text-m">Email</label>
        <input type="email" id="email" bind:value={email} 
        on:input={() => clearValidationMessage('email')} class="input-field" />
        {#if validationMessages.email}
          <p class="validation-message">{validationMessages.email}</p>
        {/if}
      </div>
    </div>

    <label class="reply-label">
      <input type="checkbox" bind:checked={reply} />
      I would like to receive a reply
    </label>
    <a href="/" class="privacy-policy-link">Privacy Policy</a>
    {#if $submissionError}
      <p class="error-message">Error submitting feedback. Please try again.</p>
    {:else}
      {#if $feedbackSubmitted}
        <p class="success-message">Thank you for your feedback.</p>
      {:else}
        <button type="submit" class="send-button">Send</button>
      {/if}
    {/if}
  </form>
</div>

<style>
  .feedback-container {
    margin-left: 6rem;
    margin-top: 3rem;
    margin-right: 16rem;
    position: relative;
    font-weight: 300;
    font-size: smaller;
  }

  .feedback-container p {
    line-height: 1.4;
  }

  .feedback-form {
    font-size: smaller;
    font-weight: 300;
  }

  .feedback-form label {
    display: block;
    display: flex;
    align-items: center;
    font-weight: 300;
    font-size: smaller;
    line-height: 1.1;
  }


  .feedback-form input[type="radio"], .feedback-form input[type="checkbox"] {
    transform: scale(0.5);
    border: 2px solid rgb(188, 185, 185);
  }
  
  .feedback-form select {
    margin-top: 0.5rem;
    margin-left: 1rem;
    margin-bottom: 1rem;
    padding: 0 1rem;
    font-size: 12px;
    width: 286px;
    height: 23px;
    border: 1px solid #ccc;
    border-radius: 16px;
    line-height: 22px;
  }

  .responsive-break {
    display: none;
  }

  .feedback-form textarea {
    width: 350px;
    padding-top: 0.2rem;
    font-size: 9px;
    border: 1px solid #ccc;
    border-radius: 2px;
    height: 60px;
    background-color: #f4f4f4;
    box-shadow: none;
    line-height: 12px;
  }

  .feedback-form textarea:focus {
    background-color: #ecf3fb;
    border-color: #b3d0ef;
    outline: none;
  }

  .name-email-container {
    display: flex;
    gap: 12px; 
  }

  .name-input, .email-input {
    width: calc(50% - 6px);
  }

  .input-field {
    width: 100%;
    margin-top: 0.2rem;
    padding: 0.2rem 1rem;
    font-size: smaller;
    border: 1px solid #ccc;
    border-radius: 2px;
    height: 23px;
    background-color: #f4f4f4;
    box-shadow: none;
  }

  .input-field:focus {
    background-color: #ecf3fb;
    border-color: #b3d0ef;
    outline: none;
  }

  .reply-label {
    display: block;
    margin-top: 1rem;
    font-size: smaller;
    font-weight: 300;
  }

  .privacy-policy-link {
    display: block;
    margin-top: 0.2rem;
    margin-left: 0.2rem;
    font-size: smaller;
    text-decoration: underline;
  }

  .send-button {
    display: inline-block;
    margin-top: 1rem;
    margin-bottom: 3rem;
    padding: 0.5rem 1rem;
    background-color: #1e1f20;
    color: #fff;
    border: none;
    border-radius: 2px;
    cursor: pointer;
    font-size: smaller;
  }

  .send-button:hover {
    background-color: #ffffff;
    color: #1b1818;
    border: 1px solid #000;
  }

  .validation-message {
    color: red;
    font-size: smaller;
  }

  @media (max-width: 768px) {
    .feedback-container {
      margin-left: 1rem;
      margin-right: 12rem;
    } 
    .feedback-form textarea {
      width: 100%;
      margin-right: 12rem;
    } 
  }

  @media (min-width: 1024px) {
    .responsive-break {
      display: block;
    }  
  }

  @media (min-width: 768px) {
    .feedback-form textarea {
      width: calc(60% - 2px);
    }
    .name-input,
    .email-input {
      width: calc(30% - 12px);
    }
    .name-email-container {
      gap: 24px;
    }
  }

</style>
