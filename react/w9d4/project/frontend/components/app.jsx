import React from "react";
import TodoListContainer from "./todos/todo_list_container";

const App = () => {
  return (
    <div>
      <TodoListContainer />
    </div>
  );
};

export default App;

// const App = ({ store }) => {
//   return <Provider store={store} >(
//     <div>
//       <TodoListContainer />
//     </div>
//   </Provider>;
// };