import { Provider } from 'react-redux';

const allTodos = ({ todos }) => {
  const arr = Object.keys(todos);
  return arr.map (id => {
    todos[id];
  });
};

window.allTodos = allTodos;
export default allTodos;


