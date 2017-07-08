import React from 'react';

class Clock extends React.Component {
  componentDidMount() {
    this.intervalId = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount(){ clearInterval(this.intervalId); }

  constructor() {
    super();
    this.state = {time: new Date()};

  }

  tick() {
    this.setState({time: new Date()});
  }

  render() {
    const { time } = this.state;
    // let hours = time.getHours() < 10 ? "0" + time.getHours() : time.getHours();
    // let minutes = time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes();
    // let seconds = time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds();

    return (
      <div className="awesomeClock">
        <h2>Awesome Clock</h2>
        <div className="clock">
          <div>
            <span className="time">Time:</span>
            <span className="time">{time.toLocaleTimeString()}</span>
          </div>

          <div>
            <span className="date">Date:</span>
            <span className="date">{time.toDateString()}</span>
          </div>
        </div>

      </div>
    );
  }
}

export default Clock;
