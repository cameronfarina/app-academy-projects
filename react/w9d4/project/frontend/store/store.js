import { createStore } from "redux";
import rootReducer from "../reducers/root_reducer";

const configureStore = () => {
  const store = createStore(rootReducer);
  return store;
};

window.configureStore = configureStore;
export default configureStore;
