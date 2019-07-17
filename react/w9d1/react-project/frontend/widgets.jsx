import ReactDOM from "react-dom";
import React from "react";
import Clock from "./clock";

function App() {
  return (
    <div>
      <Clock />
    </div>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<App />, document.getElementById("root"));
});
