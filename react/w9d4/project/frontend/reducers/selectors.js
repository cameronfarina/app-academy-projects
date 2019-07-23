
const allTodos = ({ todos }) => {
  const arr = Object.keys(todos);
  return arr.map (id => {
    return todos[id];
  });
};

window.allTodos = allTodos;
export default allTodos;


