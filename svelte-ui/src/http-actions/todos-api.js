const getTodos = async () => {
    const response = await fetch("http://localhost:3001/api/todos");
    return await response.json();
  };

/*
const createTodo = async (todo) => {
    const response = await fetch("http://localhost:8000/api/todos", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(todo)
    });
  
    return await response.json();
  };
*/

export { getTodos };