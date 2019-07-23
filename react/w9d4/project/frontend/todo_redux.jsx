import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import allTodos from "./reducers/selectors";
import fetchTodos from './util/todo_api_util';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const store = configureStore();
  ReactDOM.render(<Root store={store} />, root);
  window.store = store;
});
