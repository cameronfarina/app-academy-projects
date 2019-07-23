import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {
  render() {
    const { todos, receiveTodo } = this.props;
    const todoItem = todos.map(todo => (<TodoListItem todo={todo} />));
    // debugger;
    return (
      <div>
        <ul>{todoItem}</ul>
        <TodoForm receiveTodo={receiveTodo} />
      </div>
    );
  }
}

export default TodoList;
