<script>
    import { onMount } from 'svelte';
    import { getTodos } from '../../http-actions/todos-api.js';
  
    let todos = $state([]);
  
    onMount(async () => {
      todos = await getTodos();
    });
  </script>
  
  <h1>Todos</h1>
  
  <ul>
    {#each todos as t}
      <li>{t.todo}</li>
    {/each}
  </ul>