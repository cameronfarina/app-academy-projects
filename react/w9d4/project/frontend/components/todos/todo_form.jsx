import React from "react";
import { uniqueId } from '../../util/unique_id';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      finished: false
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Title:
          <input
            type="text"
            name="title"
            value={this.state.title}
            onChange={this.handleChange}
          />
        </label>

        <label>
          Body:
          <input
            type="text"
            name="body"
            value={this.state.body}
            onChange={this.handleChange}
          />
        </label>

        <button>Submit</button>
      </form>
    );
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.receiveTodo({ id: uniqueId(), title: event.target["title"].value, body: event.target["body"].value });
    this.setState({ title: "", body: "" });
  }

  handleChange(event) {
    const name = event.target.name;
    const value = event.target.value;

    this.setState({
      [name]: value
    });
    // debugger
  }
}

export default TodoForm;
