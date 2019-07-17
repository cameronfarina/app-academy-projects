import React from "react";

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  render() {
    return (
      <div>
        <h1>Clock</h1>
        <section class="clock">
          <p>
            <span>
              Time:
            </span>
            <span>
              {`${this.state.time.getHours()}:${this.state.time.getMinutes()}:${this.state.time.getSeconds()}`}
            </span>
          </p>
          <p>
            <br />
            <span>Date:</span>
            <span> {this.state.time.toDateString()} </span>
          </p>
        </section>
      </div>
    );
  }

  tick() {
    this.setState({ time: new Date() });
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }
}
