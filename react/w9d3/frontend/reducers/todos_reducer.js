import {
  RECEIVE_TODOS,
  RECEIVE_TODO,
  receiveTodo,
  receiveTodos
} from "../actions/todo_actions";
import merge from "lodash";

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach(todo => {
        newState[todo.id] = todo;
      });
      return newState;
    case RECEIVE_TODO:
      const newTodo = { [action.todo.id]: action.todo };
      return merge({}, state, newTodo);
    default:
      return state;
  }
};

export default todosReducer;
