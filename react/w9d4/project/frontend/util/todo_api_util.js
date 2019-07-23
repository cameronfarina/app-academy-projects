const fetchTodos = () => {
  $.ajax({
    method: "GET",
    url: "/api/todos"
  });
};

window.fetchTodos = fetchTodos;
export default fetchTodos;
