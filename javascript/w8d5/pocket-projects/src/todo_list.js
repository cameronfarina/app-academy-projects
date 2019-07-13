// Create a function called addTodo that will be in charge of listening for the submit event on the form.
//The addTodo function will:

//     Find the input with the name add - todo and set's it's value to a variable
// Create a new todo object with the value from add - todo and a done key set to false
// Push the todo object into the todos array.
// Reset the add - todo input to be empty so that the user can easily enter another todo
const todos = [];
const newTodos = document.querySelector(".todos");
const todoForms = document.querySelector(".add-todo-form");
function addTodo() {
  todoForms.addEventListener("submit", e => {
    const addTodo = ddocument.querySelector("[name=add-todo]").value;
    const todo = {
      task: addToDo,
      done: false
    };
    todos.push(todo);
    document.document.querySelector("[name=add-todo]").value = "";
  });
}

addTodo();
